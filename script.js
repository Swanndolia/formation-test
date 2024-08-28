const BASE_URL = "https://pokeapi.co/api/v2/";
let currentId = 0;

document.getElementById("searchBtn").addEventListener("click", async () => {
    const response = await fetch(BASE_URL + "pokemon/" + document.getElementById("search").value)
    displayPokemon(await response.json())
})

function displayPokemon(data) {
    currentId = data.id
    document.getElementById("pokeType1").innerHTML = ""
    document.getElementById("pokeType2").innerHTML = ""
    document.getElementById("pokeAbilities1").innerHTML = ""
    document.getElementById("pokeAbilities2").innerHTML = ""
    document.getElementById("pokePicture").src = data.sprites.front_default
    document.getElementById("pokemonName").textContent = data.name + " (" + data.id + ")"
    document.getElementById("pokeWeight").textContent = data.weight + " lbs"
    document.getElementById("pokeSize").textContent = data.height + `"`
    data["types"].forEach(element => {
        element.slot <= 2 ?
            document.getElementById("pokeType1").innerHTML += "<p>" + element.type.name + "</p>" :
            document.getElementById("pokeType2").innerHTML += "<p>" + element.type.name + "</p>"
    });
    data["abilities"].forEach(element => {
        element.slot <= 2 ?
            document.getElementById("pokeAbilities1").innerHTML += "<p>" + element.ability.name + "</p>" :
            document.getElementById("pokeAbilities2").innerHTML += "<p>" + element.ability.name + "</p>"
    });
    displayEvolutions(data.id)
}

async function displayEvolutions(id) {
    document.getElementById("pokeEvo").innerHTML = ""
    const response = await fetch(BASE_URL + "evolution-chain/" + id)
    const data = await response.json()
    const resp = await fetch(BASE_URL + "pokemon/" + data.id)
    const evoData = await resp.json()
    const evoImg = document.createElement("img")
    evoImg.src = evoData.sprites.front_default
    document.getElementById("pokeEvo").appendChild(evoImg)
}

async function getNextPokemon(order) {
    order == -1 ? currentId-- : currentId++
    const response = await fetch(BASE_URL + "pokemon/" + currentId)
    if (response.status == 404) {
        order == -1 ? currentId++ : currentId--
        return
    }
    displayPokemon(await response.json())
}

