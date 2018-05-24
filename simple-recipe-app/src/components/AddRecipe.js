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
            <h2 class='addRecipeLabel'>Add a recipe:</h2>
            <br/>
            <fieldset id="addRecipeFieldset">
              <label for="inputBox">Name: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter recipe name..." size='40' onChange={this.handleName} value={this.state.name} />
              </span>
              <label for="inputBox">Ingredients: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter ingredients separated by comma..." size='40' onChange={this.handleIngredients} value={this.state.input} />
              </span>
              <br/>
              <label for="inputBox">Steps: </label>
              <span class="inputBox">
                <input type="text" placeholder="Enter steps separated by comma..." size='40' onChange={this.handleSteps} value={this.state.input} />
              </span>
              <label for="inputBox">Image URL: </label>
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
        const ingredientsArr = event.target.value.split(',');
        this.setState({
            ingredients: ingredientsArr
        })
    }

    handleSteps = event => {
        const stepsArr = event.target.value.split(',');
        this.setState({
            steps: stepsArr
        })
    } 

    handleURL = event => {
        this.setState({
            imageURL: event.target.value
        })
    }

    handleClick = () => {
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