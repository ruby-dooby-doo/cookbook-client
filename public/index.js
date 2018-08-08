console.log('in index.js');

// get the box
// get the thing you want to put in the box
// copy the thing and put it in the box

var recipeTemplate = document.querySelector('#recipe-card');

var recipeContainer = document.querySelector('.row');

recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));
recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));
recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));
recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));


axios.get("localhost:3000/api/recipes").then(function(response) {
  console.log(response);
});
