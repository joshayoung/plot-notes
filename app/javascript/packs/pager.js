import Interval from './interval';
import { fetch } from 'whatwg-fetch';

export default class Pager {
  constructor() {
    this.interval = new Interval();
    this.setupOnclick();
    // this.interval.timer();
  }

  setupOnclick() {
    this.mybutton = document.getElementById("show_timer");
    this.mybutton.onclick = () => {
      this.interval.start();
      this.getQuotes();
    }
  }

  setQuote(quote) {
    this.mybutton.innerText = quote;
  }

  setBackground() {
    let background = document.querySelector(".lists li a")
    if (background !== null) {
      background.style.backgroundColor = "#cccccc";
    }
  }

  getQuotes() {
    let self = this;
    fetch('https://api.adviceslip.com/advice')
    .then(function(response) {
      return response.json()
    }).then(function(data) {
      self.setQuote(data.slip.advice);
    }).catch(function(error) {
      console.log('error', error)
    });
  }
}