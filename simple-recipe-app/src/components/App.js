import React from 'react';
import RecipeArr from '../recipes';
import Recipes from './Recipes';
import AddRecipe from './AddRecipe';
import SearchByNameOrIngredient from './SearchByName';

class App extends React.Component {
  state = {
    recipes: RecipeArr,
    filter: ''
  };

  render() {
    return (
      <div>
        <h1 className="header">Recipe Book</h1>
        <SearchByNameOrIngredient handleInput={this.handleInput}/>
        <AddRecipe submitRecipe={this.submitRecipe}/>
        <Recipes recipes={this.state.filter === '' ? this.state.recipes : this.state.recipes.filter(recipe => {
          const filterWords = this.state.filter.split(' ');
          return (
            filterWords.every(word => recipe.name.toLowerCase().includes(word))
            || filterWords.every(word => recipe.ingredients.join(' ').includes(word))
          )
        })} />
      </div>
    );
  }

  handleInput = event => {
    this.setState({
      filter: event.target.value
    });
  }

  submitRecipe = (recipeName, ingredientsArr, stepsArr, imageLink) => {
    const newRecipe = {
      name: recipeName,
      ingredients: ingredientsArr,
      steps: stepsArr,
      imageURL: imageLink
    };
    this.setState({
      recipes: [...this.state.recipes, newRecipe]
    });
  }
}

export default App;