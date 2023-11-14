const categoryReqLink = 'http://127.0.0.1:8000/categoryReq';
const indexLink = 'http://127.0.0.1:8000/indexProduct';
const categoriesLink = 'http://127.0.0.1:8000/categories';
const priceLink = 'http://127.0.0.1:8000/price';

function setLinkFromId(element){
    switch(element.id){
        case "categoryRequest":
            element.setAttribute('action', categoryReqLink);
            break;
        case "priceRequest":
            element.setAttribute('action', priceLink);
        default:
            break; 
    }
}
