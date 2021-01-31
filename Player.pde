Player player = new Player(new PVector(0, 0));

public class Player extends Plottable {

  private float size;
  public int life;

  Player(PVector pos) {
    super(pos);
    this.size = 15;
    this.life = 3;
  }

  public float getSize() {
    return this.size;
  }

  public void update() {
    float terrainMulti = 0.02;
    if (onWater()) {
      terrainMulti = 0.01;
    }

    PVector movement = new PVector(mouseX - center.x, mouseY - center.y);
    float magnitude = constrain(map(movement.mag(), 20, 150, 0, 100), 0, 100);
    PVector direction = movement.normalize().mult(magnitude * terrainMulti);
    this.move(direction);
    
  }

  public void status() {
    if (this.life <= 0) {
      println("PLAYER DIED");
      exit();
    }
  }

  public void displayInventory(float x, float y) {
    textSize(16);
    fill(0);
    text("Wood: " + wood.count, x, y);
    text("Bottles: " + bottles.count, x, y - 20);
  }

  public void render() {
    stroke(0);
    fill(255, 0, 0);
    circle(center.x, center.y, this.size);
  }
}
