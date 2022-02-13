function setAppSelected(app) {
    setTextFieldFocus(false)
    switch(app) {
    case 0:
        appSelected = "androidauto"
        break
    case 1:
        appSelected = "androidautoservice"
        break
    case 2:
        appSelected = "carplay"
        break
    case 3:
        appSelected = "carplayservice"
        break
    case 4:
        setTextFieldFocus(true)
        console.log("click" + appSelected)
        break
    }
    console.log("setAppSelected " + appSelected)
}

function setTextFieldFocus(focus) {
    textField.enabled = focus
    textField.focus = focus
}

function addText(result) {
    console.log(result)
    console.log("addText")
//    content.insert(0, "\n")
    content.insert(content.text.length, result)
}

function setPath(path) {
    var url = path.replace("file://","") + "/"
    console.log(url)
    return url
}


function print2(path) {
    console.log("print: " + path)
}

