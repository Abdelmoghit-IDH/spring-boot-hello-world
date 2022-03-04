def buildApp(){
    echo "Building the app"
}

def testApp(){
    echo "Testing the app"
}

def deployApp(){
    echo "deploying version ${params.VERSION}"
    echo "Deploying the app"
}

return this