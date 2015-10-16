public class Fuel {

  private PImage fuelbar;
  private int fuel;
  private int now;

  public Fuel() {
    this.fuel = 100;
    this.fuelbar = loadImage("fuelbar.png");
    this.now = millis();
  }

  public int getFuelLeft() {
    return fuel;
  }

  public void increment() {
    fuel += 10;
    fixFuel();
  }

  public void reduce() {
    fuel -= 5;
    fixFuel();
  }

  public void update() {
    if (millis() - now > 1000) {
      fuel -= 1;
      now = millis();
    }
    fixFuel();
  }

  public void fixFuel() {
    if (fuel < 0) {
      fuel = 0;
    } else if (fuel > 100) {
      fuel = 100;
    }
  }

  public void draw() {
    fill(241, 196, 15);

    image(fuelbar, 25, 645);
    rect(31, 651, 211 * fuel / 100, 25);

    fill(255, 255, 255);
    textSize(18); 
    text("Fuel left: " + fuel + "%", 25, 635);
  }
}

