const zomatoInnerCard = document.querySelector('#add-channel-inner-zomato')
const tripAdvisorInnerCard = document.querySelector('#add-channel-inner-tripadvisor')
const yelpInnerCard = document.querySelector('#add-channel-inner-yelp')
const facebookInnerCard = document.querySelector('#add-channel-inner-facebook')
const instagramInnerCard = document.querySelector('#add-channel-inner-instagram')

const zomatoFrontCard = document.querySelector('#add-channel-front-zomato')
const tripAdvisorFrontCard = document.querySelector('#add-channel-front-tripadvisor')
const yelpFrontCard = document.querySelector('#add-channel-front-yelp')
const facebookFrontCard = document.querySelector('#add-channel-front-facebook')
const instagramFrontCard = document.querySelector('#add-channel-front-instagram')

const cardSets = [[zomatoInnerCard, zomatoFrontCard], [tripAdvisorInnerCard, tripAdvisorFrontCard],
                  [yelpInnerCard,yelpFrontCard], [facebookInnerCard, facebookFrontCard],
                  [instagramInnerCard, instagramFrontCard]];


console.log(cardSets);

cardSets.forEach((cardSet) => {
  console.log(cardSet);
  cardSet[1].addEventListener('click', (e) => {
    console.log(cardSet[1] + "clicked");
    cardSet[0].classList.add("rotate");
  });
})
