import { StructuredContentGenerator } from "./structured-content-generator";


async function loadJson(){
    const response = await fetch('testcontent.json');
    const jsonContent = await response.json();
    const generator = StructuredContentGenerator();

    let translation = generator.createStructuredContent(jsonContent," ");

    document.getElementById('test').innerHTML = translation;


}

loadJson();


