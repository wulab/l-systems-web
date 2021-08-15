class Plane {
  constructor(name, width, height) {
    const canvas = document.createElement('canvas');
    const figure = document.createElement('figure');
    const figcaption = document.createElement('figcaption');

    canvas.width = width;
    canvas.height = height;
    figure.append(canvas);

    figcaption.textContent = name;
    figure.append(figcaption);

    document.body.append(figure);

    this.name = name;
    this.width = width;
    this.height = height;
    this.ctx = getContext(canvas);

    function getContext(canvas) {
      const ctx = canvas.getContext('2d');
      // rotate the plane so 90-degree angle points up
      ctx.translate(canvas.width, canvas.height);
      ctx.rotate(Math.PI);
      return ctx;
    }
  }
}

class Turtle {
  constructor(plane) {
    this.plane = plane;
    this.ctx = plane.ctx;
    this.ctx.beginPath();
    this.setState(plane.width/2, plane.height/2, 90);
  }

  setState(x, y, a) {
    this.ctx.moveTo(x, y);
    this.state = new State(x, y, a);
  }

  move(d, a) {
    const newState = new State(
      this.state.x + (d * Math.cos((Math.PI/180) * this.state.a)),
      this.state.y + (d * Math.sin((Math.PI/180) * this.state.a)),
      this.state.a + a
    );

    if (!State.samePosition(this.state, newState)) {
      this.ctx.lineTo(newState.x, newState.y);
    }

    this.state = newState;
  }

  forward(d) {
    this.move(d, 0);
  }

  turnLeft(a) {
    this.move(0, -a);
  }

  turnRight(a) {
    this.move(0, a);
  }

  draw() {
    this.drawPath();
    this.drawSelf();
  }

  drawPath() {
    this.ctx.stroke();
    this.ctx.closePath();
  }

  drawSelf() {
    this.ctx.save();
    this.ctx.beginPath();
    this.ctx.translate(this.state.x, this.state.y);
    this.ctx.rotate((Math.PI/180) * this.state.a);
    this.ctx.moveTo(0, 0);
    this.ctx.lineTo(-20, 8);
    this.ctx.lineTo(-20, -8);
    this.ctx.closePath();
    this.ctx.fill();
    this.ctx.restore();
  }
}

class State {
  constructor(x, y, a) {
    this.x = x;
    this.y = y;
    this.a = a;
  }

  static samePosition(s1, s2) {
    return s1.x === s2.x && s1.y === s2.y;
  }
}

function main() {
  // const plane = new Plane('A Plane', 500, 500);
  // const turtle = new Turtle(plane);
  // turtle.forward(100);
  // turtle.turnRight(90);
  // turtle.forward(200);
  // turtle.draw();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', main);
} else {
  main();
}
