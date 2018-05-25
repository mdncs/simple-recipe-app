import React from 'react';

class SearchByNameOrIngredient extends React.Component {

    render () {
        return <fieldset id='searchFieldset'>
            <div class="searchBox"><br/>
              <label class='searchLabel' for="searchBox">Find recipe by name:</label>
            </div>
              <input class='searchInput' type="text" placeholder="Enter recipe name" size="30" onChange={this.props.handleInput} /><br/>
            <div id='searchBoxRight' class="searchBox">
              <label class='searchLabel' for="searchBox">Find recipe by ingredients: </label>
          </div>
          <input class='searchInput' type="text" placeholder="Enter ingredients separated by comma" size="30" onChange={this.props.handleInput} />
          </fieldset>;
    }
}

export default SearchByNameOrIngredient;