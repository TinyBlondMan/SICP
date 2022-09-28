let sqrt = 2;
let guess = 1;


for (let i = 0; i < 200; i++) {
    let quot = (sqrt / guess);
    let ave = ((quot + guess) / sqrt);
    guess = ave;
    console.log(guess)
  }