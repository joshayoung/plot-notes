export default class Interval {
  constructor() {}
  start() {
    console.log('started');
  }

  timer() {
    let seconds = 0;
    let intv = setInterval(function() {
      seconds++;
      console.log(seconds);
    }, 1000);
  }
}