import axios from "axios";

export default class Search {
  constructor(search_div = null) {
    this.search_div = search_div;
  }

  notesWithTag(tag) {
    let self = this;
    axios({
      method: 'post',
      url: '/search.json',
      data: { tag: tag },
      responseType: 'json',
      headers: { 'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content }
    })
    .then(function(response) {
      self.search_div.innerHTML = response.data;
    })
    .catch(function(error) {
      console.log(error);
    });
  }
}