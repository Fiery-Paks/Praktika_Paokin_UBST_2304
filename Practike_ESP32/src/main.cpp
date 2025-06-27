#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// Настройки Wi-Fi
#define WIFI_SSID "Wokwi-GUEST"
#define WIFI_PASSWORD ""

// Настройки Firebase
#define FIREBASE_HOST "arduinodb-b6b48-default-rtdb.europe-west1.firebasedatabase.app"
#define FIREBASE_AUTH ""//пароль убран!!!

// Пины (занятые)
#define BUZZER_PIN 25
#define BUTTON_RESET 32
#define BUTTON_SEND 27
#define POTENTIOMETER_PIN 34
#define SW1_LEFT  4  // Левый контакт 1-го переключателя
#define SW2_LEFT  18 // Левый контакт 2-го переключателя
#define BUTTON_PLUS 23
#define BUTTON_MINUS 22

//Экран
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
// Указываем свои пины I2C (SDA=16, SCL=17)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Таймер для обновления
unsigned long previousMillis = 0;
const long interval = 5000;

//Коэффициент
int coef = 10;
//Шаг
int step = 50 * coef;

// Диапазоны
int start_range1 = 2000 * coef;
int start_range2 = 3000 * coef;
int max_range = 4000 * coef;

// Диапазоны
int range1 = start_range1;
int range2 = start_range2;

// Диапазоны булевые
bool range_change1 = false;
bool range_change2 = false;

int weight = 0;

//Код весов
int idScales = 1;

void setup() {
  Serial.begin(115200);
  
  // Настройка пинов
  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(BUTTON_SEND, INPUT_PULLUP);
  pinMode(BUTTON_RESET, INPUT_PULLUP);
  pinMode(BUTTON_PLUS, INPUT_PULLUP);
  pinMode(BUTTON_MINUS, INPUT_PULLUP);
  pinMode(SW1_LEFT, INPUT_PULLUP);
  pinMode(SW2_LEFT, INPUT_PULLUP);

  Wire.begin(16, 17); // SDA=GPIO16, SCL=GPIO17

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Адрес 0x3C или 0x3D
    Serial.println("SSD1306 не подключен!");
    while (1);
  }

  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.println("GPIO16(SDA), GPIO17(SCL)");
  display.display();
  analogReadResolution(12);
  analogSetAttenuation(ADC_11db);

  // Подключение к Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi");

  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Connecting to WiFi");
  display.display();

  while (WiFi.status() != WL_CONNECTED) {
    delay(300);
    Serial.print(".");
  }
  display.println("\nConnected!");
  Serial.println("\nConnected!");

  Serial.println("Firebase data cleanup started!");
  display.println("Firebase data cleanup started!");
  // Очистка базы данных Firebase перед отправкой новых данных
  HTTPClient http;
  String clearUrl = "https://" + String(FIREBASE_HOST) + "/sensorData/idScales"+String(idScales)+".json?auth=" + String(FIREBASE_AUTH);
  
  http.begin(clearUrl);
  int clearCode = http.sendRequest("DELETE");
  
  if (clearCode == HTTP_CODE_OK) {
    Serial.println("Firebase data cleared successfully!");
    display.println("Firebase data cleared successfully!");
  } else {
    Serial.printf("Error clearing data: %d\n", clearCode);
    display.println("Error clearing data: %d\n"+ String(clearCode));
  }
  http.end();
}

void playTone(int mode) {
  switch (mode) {
    case 1: tone(BUZZER_PIN, 600, 20); delay(80); break;
    case 2: tone(BUZZER_PIN, 800, 20); delay(30); tone(BUZZER_PIN, 800, 20); break;
    case 3: tone(BUZZER_PIN, 1000, 300); break;
    case 4: tone(BUZZER_PIN, 500, 50); break;
  }
}

void sendToFirebase(int weight, const char* eventType) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("WiFi disconnected!");
    display.clearDisplay();
    display.setCursor(0, 0);
    display.println("WiFi disconnected!");
    display.display();
    delay(1000);
    return;
  }
  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Started sending data to Firebase");
  display.display();

  String uniqueId = String(millis());
  HTTPClient http;
  String url = "https://" + String(FIREBASE_HOST) + "/sensorData/idScales"
  +String(idScales)+"/"+String(uniqueId)+".json?auth=" + String(FIREBASE_AUTH);

  
  String payload = "{\"weight\":" + String(weight) +
                   ",\"range1\":" + String(range1) + 
                   ",\"range2\":" + String(range2) + 
                   ",\"timestamp\":" + String(uniqueId) + 
                   ",\"event\":\"" + String(eventType) + "\"}";

  http.begin(url);
  http.addHeader("Content-Type", "application/json");

  int httpCode = http.PUT(payload);
  if (httpCode == HTTP_CODE_OK) {
    Serial.println("Data saved to Firebase!");
    display.clearDisplay();
    display.setCursor(0, 0);
    display.println("Data saved to Firebase!");
    display.display();
    delay(1500);
  } else {
    Serial.printf("Error: %d\n", httpCode);
    display.clearDisplay();
    display.setCursor(0, 0);
    display.println("Error: %d\n "+ String(httpCode));
    display.display();
    delay(1500);
  }
  http.end();
}
void changeRanges(int typeOperation, volatile int& range, bool isRange1) {
  if (typeOperation == 1 )
  {
    range -= step;
  }
  else if (typeOperation == 2)
  {
    range += step;
  }
  Serial.print(isRange1? "Range1 = ":"Range2 = ");
  Serial.println(range);

  display.clearDisplay();
  display.setCursor(0, 0);
  display.print(isRange1? "Range1 = ":"Range2 = ");
  display.println(range);
  display.display();
  playTone(4);
}

void loop() {
  bool sw1IsLeft = digitalRead(SW1_LEFT) == LOW;
  bool sw2IsLeft = digitalRead(SW2_LEFT) == LOW;
  unsigned long currentMillis = millis(); // Текущее время
  if (currentMillis - previousMillis >= interval) {
  previousMillis = currentMillis; // Сброс таймера
    if (sw1IsLeft)
    {
      display.clearDisplay();
      display.setCursor(0, 0);
      display.println("Edit Ranges Mode");
      display.print("Range1: ");
      display.println(range1);
      display.print("Range2: ");
      display.println(range2);
      display.display();
    }
    else 
    {
      display.clearDisplay();
      display.setCursor(0, 0);
      display.println("Metering Mode");
      display.print("Weight: ");
      display.println(weight);
      display.print("Range1: ");
      display.println(range1);
      display.print("Range2: ");
      display.println(range2);
      display.display();
    }
  }

  if (sw1IsLeft)
  {
    if (sw2IsLeft)
    {
      if (digitalRead(BUTTON_PLUS) == LOW) {
        if (range1 < range2 + step)
          changeRanges(2, range1, true);
      }
      if (digitalRead(BUTTON_MINUS) == LOW) {
        if (range1 > step)
          changeRanges(1, range1, true);
      }
    }
    else 
    {
      if (digitalRead(BUTTON_PLUS) == LOW) {
        if (range2 < max_range - step)
          changeRanges(2, range2, false);
      }
      if (digitalRead(BUTTON_MINUS) == LOW) {
        if (range2 > range1 + step)
          changeRanges(1, range2, false);
      }
    }

    if (digitalRead(BUTTON_RESET) == LOW) {
      range1 = start_range1;
      range2 = start_range2;
      display.clearDisplay();
      display.setCursor(0, 0);
      display.println("Data has Reset");
      display.print("Range1: ");
      display.println(range1);
      display.print("Range2: ");
      display.println(range2);
      display.display();
    }
  }
  else 
  {
    if (weight != analogRead(POTENTIOMETER_PIN) * coef)
    {
      weight = analogRead(POTENTIOMETER_PIN) * coef;
      display.clearDisplay();
      display.setCursor(0, 0);
      display.println("Weight: ");
      display.println(weight);
      display.display();
      delay(300); 
    }

    // Определение диапазона веса
    if (weight < range1) playTone(1);
    else if (weight < range2) playTone(2);
    else playTone(3);

    static unsigned long lastDebounceTime = 0;
    if (digitalRead(BUTTON_SEND) == LOW) {
      lastDebounceTime = millis();
      sendToFirebase(weight, "save_result");
    }

    // Вывод в Serial Monitor
    
    Serial.print("Weight: ");
    Serial.print(weight);
    Serial.print(" | Range1: ");
    Serial.print(range1);
    Serial.print(" | Range2: ");
    Serial.println(range2);
  }
  delay(150);
}