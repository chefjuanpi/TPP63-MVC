function ById(id) {return document.getElementById(id)}
function ByName(name) {return document.getElementsByName(name)}
function ByClass(className) { return document.getElementsByClassName(className) }
function ByTag(tagName) { return document.getElementsByTagName(tagName) }

function Remove(element) { element.parentElement.removeChild(element); }
function TryRemove(element) { if (document.contains(element)) Remove(element); }