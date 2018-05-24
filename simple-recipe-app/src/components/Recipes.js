import React from 'react';


function Recipes ({ recipes }) {
    
    return (
    <div className='recipe'>
        <ul>
            <br/>
            {recipes.map((recipe, i) => {
                return <div className='abcd'>
                    <h2 id='recipeName'>{recipe.name}</h2>
                    <img src={recipe.imageURL} alt=''/>
                    <div className='recipeBox'>
                    <h3 id='ingredientsBox'><span className='title'>Ingredients</span>
                        <br/>
                        <ul className='list'>
                        {recipe.ingredients.map((ingredient, i) => {
                            return <li key={i}>
                                <h5 className='ingredient'>{ingredient}</h5>
                            </li>
                        })}
                        </ul>
                    </h3>
                    <br/>
                        <h3 id='methodsBox'><span className='title'>Methods</span>
                        <br/>
                        <ul class='list'>
                            {recipe.steps.map((step, i) => {
                                return <li key={i}>
                                    <h5 className='method'>{step}</h5>
                                </li>
                            })}
                        </ul>
                    </h3>
                    </div>
                </div>
            })}
        </ul>
    </div>
    )
}

export default Recipes;