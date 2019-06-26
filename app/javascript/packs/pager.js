import Interval from './interval';
import axios from "axios";

export default class Pager {
  constructor() {
    this.interval = new Interval();
    this.setupOnclick();
    this.interval.timer();
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
    axios.get('https://api.adviceslip.com/advice')
      .then((response) => {
        this.setQuote(response.data.slip.advice);
      })
      .catch((error) => {
        console.log(error);
      });
  }
}