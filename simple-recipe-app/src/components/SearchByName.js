import React from 'react';

class SearchByNameOrIngredient extends React.Component {

    render () {
        return <fieldset id='searchFieldset'>
            <div class="searchBox"><br/>
              <label for="searchBox">Find a recipe by name: </label>
              <br/>
              <input type="text" placeholder="Enter recipe name" size="30" onChange={this.props.handleInput} /><br/>
            </div>
            <div id='searchBoxRight' class="searchBox">
              <label for="searchBox">Find a recipe by ingredients: </label>
              <br />
              <input type="text" placeholder="Enter ingredients separated by comma" size="30" onChange={this.props.handleInput} />
            </div>
          </fieldset>;
    }
}

export default SearchByNameOrIngredient;