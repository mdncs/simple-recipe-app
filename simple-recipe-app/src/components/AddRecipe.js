import React from 'react';

class AddRecipe extends React.Component {
    state = {
        name: '',
        ingredients: '',
        steps: '',
        imageURL: ''
    }

    render () {
        return <form id='inputForm'>
            <br/>
            <h2 class='addRecipeTitle'>Add a recipe:</h2>
            <br/>
            <fieldset id="addRecipeFieldset">
              <label class='addRecipeLabel' for="inputBox">Name: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter recipe name..." size='40' onChange={this.handleName} value={this.state.name} />
              </span>
                <label class='addRecipeLabel' for="inputBox">Ingredients: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter ingredients separated by semi-colon..." size='40' onChange={this.handleIngredients} value={this.state.input} />
              </span>
              <br/>
                <label class='addRecipeLabel' for="inputBox">Steps: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter steps separated by semi-colon..." size='40' onChange={this.handleSteps} value={this.state.input} />
              </span>
                <label class='addRecipeLabel' for="inputBox">Image URL: </label>
              <span class="inputBox">
                <input type="text" placeholder="Paste image URL here..." size='40' onChange={this.handleURL} value={this.state.input} />
              </span>
              <br />
              <br/>
              <button id="addRecipeButton" onClick={this.handleClick}> Add recipe</button>
            </fieldset>
          </form>;
    }

    handleName = event => {
        this.setState({
            name: event.target.value
        })
    } 
    
    handleIngredients = event => {
        const ingredientsArr = event.target.value.split(';');
        this.setState({
            ingredients: ingredientsArr
        })
    }

    handleSteps = event => {
        const stepsArr = event.target.value.split(';');
        this.setState({
            steps: stepsArr
        })
    } 

    handleURL = event => {
        this.setState({
            imageURL: event.target.value
        })
    }

    handleClick = event => {
        event.preventDefault();
        this.props.submitRecipe(this.state.name, this.state.ingredients, this.state.steps, this.state.imageURL);
        this.setState({
            name: '',
            ingredients: '',
            steps: '',
            imageURL: ''
        });
    };

}

export default AddRecipe;