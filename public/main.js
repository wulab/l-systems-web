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
      // https://stackoverflow.com/a/33499668
      ctx.setTransform(1, 0, 0, -1, 0, canvas.height);
      return ctx;
    }
  }

  createTurtle(x, y, a) {
    const state = new State(x, y, a);
    return new Turtle(this, state);
  }
}

class Turtle {
  constructor(plane, state) {
    const ctx = plane.ctx;

    ctx.beginPath();
    ctx.moveTo(state.x, state.y);

    this.plane = plane;
    this.state = state;
    this.ctx = ctx;
  }

  drawSelf() {
    this.ctx.save();
    this.ctx.beginPath();
    this.ctx.translate(this.state.x, this.state.y);
    this.ctx.rotate((Math.PI/180) * this.state.a);
    this.ctx.moveTo(0, 0);
    this.ctx.lineTo(-20, 10);
    this.ctx.lineTo(-20, -10);
    this.ctx.closePath();
    this.ctx.fill();
    this.ctx.restore();
  }

  move(d, a) {
    const newState = new State(
      this.state.x + (d * Math.cos((Math.PI/180) * this.state.a)),
      this.state.y + (d * Math.sin((Math.PI/180) * this.state.a)),
      this.state.a + a
    );

    if (!State.samePosition(this.state, newState)) {
      this.ctx.lineTo(newState.x, newState.y);
      this.ctx.stroke();
    }

    this.state = newState;
  }

  forward(d) {
    this.move(d, 0);
  }

  turnLeft(a) {
    this.move(0, a);
  }

  turnRight(a) {
    this.move(0, -a);
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
  // const turtle = plane.createTurtle();
  // turtle.forward(100);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', main);
} else {
  main();
}
