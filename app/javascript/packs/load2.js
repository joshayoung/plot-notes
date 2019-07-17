import Search from "./search";

if(document.getElementById('search_value')) {
  let search = new Search(document.getElementById("search_results"));
  let input = document.getElementById('search_value');

  input.addEventListener("keyup", function(event) {
    let len = this.value.length;
    if (len >= 3) {
      search.notesWithTag(this.value);
    }
  });
}