
import { fetch } from 'whatwg-fetch';

export default class Search {
  constructor(search_div = null) {
    this.search_div = search_div;
  }

  notesWithTag(tag) {
    let self = this;
    fetch('/search.json', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      body: JSON.stringify({
        tag: tag
      })
    }).then(function(response) {
      return response.json();
    }).then(function(data) {
      self.search_div.innerHTML = data;
    }).catch(function(ex) {
      console.log('parsing failed', ex)
    });
  }
}