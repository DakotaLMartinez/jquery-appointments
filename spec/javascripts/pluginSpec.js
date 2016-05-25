describe("Jasmine Matchers Plugin", function(){
  it("offers new Jasmine matchers", function(){
    expect(toBeEmptyObject).toBeDefined();
    expect(toHaveArray).toBeDefined();
  });  
});

describe("Jasmine Jquery", function(){
  it("defines matchers for jQuery objects", function(){
    expect(setFixtures).toBeDefined();
  });
});

