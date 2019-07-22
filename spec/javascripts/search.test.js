import Search from '../../app/javascript/packs/search';
import { fetch } from 'whatwg-fetch';

describe("Search", () => {
  let search = null;

  beforeEach( () => { });

  describe("#notesWithTag", () => {
    it('should post to the correct endpoint', () => {
      search = new Search();
      jest.mock('fetch');

      let notes = search.notesWithTag("something");

      expect(notes).toBeTruthy();
    });
  })
});
