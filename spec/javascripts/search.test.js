import Search from '../../app/javascript/packs/search';
describe("Search", () => {
  let search = null;

  beforeEach( () => { });

  describe("#notesWithTag", () => {
    it('should post to the correct endpoint', () => {
      console.log(fetch);
      fetch.mockResponse(() => notesWithTag().then(res => ({body: res}));

      search = new Search();

      let notes = search.notesWithTag("something");

      expect(notes).toBeTruthy();
    });
  })
});
