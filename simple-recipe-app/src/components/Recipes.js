import React from 'react';


function Recipes ({ recipes }) {
    
    return (
    <div className='recipe'>
        <ul>
            <br/>
            {recipes.map((recipe, i) => {
                return <div>
                    <h2 id='recipeName'>{recipe.name}</h2>
                    <img src={recipe.imageURL} alt=''/>
                    <h3 className='ingredientsBox'>Ingredients
                        <br/>
                        <ul>
                        {recipe.ingredients.map((ingredient, i) => {
                            return <li key={i}>
                                <h5 className='ingredient'>{ingredient}</h5>
                            </li>
                        })}
                        </ul>
                    </h3>
                    <br/>
                    <h3 className='methodsBox'>Methods
                        <br/>
                        <ul>
                            {recipe.steps.map((step, i) => {
                                return <li key={i}>
                                    <h5 className='method'>{step}</h5>
                                </li>
                            })}
                        </ul>
                    </h3>
                    <br/>
                </div>
            })}
        </ul>
    </div>
    )
}

export default Recipes;