## Contributing to StuduWidgets

You are more than welome to contribute and help us make StuduWidgets the best version of themselves! You can do so using GitHub by forking the repository and sending a pull request. 

Before submitting your changes, please make sure your code resonates with our conventions and style in order to keep the code as readable as possible. 

## License 

By contributing your code, you agree to license your contribution under the terms of the MIT License: 
https://github.com/filiptronicek/StuduWidgets/blob/main/LICENSE

All files are released with the MIT License.

# Guidelines 

For the sake of readability, it's importatnt to be consistent while writing code. Here are noted our conventions and style to make it easier for everybody!

### Table of contents 

+ <a href="">Spacing</a>
+ <a href="">Buttons</a>

## Buttons 

```swift
Button(action: {
          <code>
       },
       label: {
          <code> 
})
```

## Spacing

We only use blank lines between views in containers and between containers themselves as shows the following code snippet...

```swift
var body: some View {
    ZStack {
        bg.ignoresSafeArea()
            
        VStack {
            Text("StuduWidgets")
                .foregroundColor(fontClr)
                .font(.system(size: screenSize.width / 10))
                .padding(.trailing, screenSize.width / 5)
                .padding([.top, .bottom], screenSize.width / 18)
                
            if showingSettings == false {
                ScrollView {
                    VStack {
                        if isSignedInToBakalari == false && isSignedInToStrava == false {
                            Text("Get started")
                                .foregroundColor(objectsClrLight)
                                .font(.system(size: screenSize.width / 15))
                                .padding(.trailing, screenSize.width / 1.8)
                                .padding(.bottom, screenSize.width / 60)
                            
                            Text("For a widget to work, you need to **sign in** \nto a corresponding service...")
                                .foregroundColor(fontClr)
                                .font(.system(size: screenSize.width / 25))
                                .frame(width: screenSize.width / 1.2, height: screenSize.width / 10)
                                .padding(.bottom, screenSize.width / 25)
                                .padding(.trailing, screenSize.width / 9)

                            HStack {
                            
                              ...
                                
```
