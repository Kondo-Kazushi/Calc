//
//  ContentView.swift
//  Shared
//
//  Created by 近藤和志 on 2022/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var Histry: Int = 0
    @State var plus = false
    @State var minus = false
    @State var times = false
    @State var divide = false
    @State var editing = false
    @State var end = false
    @State var x: Int = 0
    @State var x2: Int = 0
    @State var y: Int = 0
    @State var y2: Int = 0
    @State var result: Int = 0
    
    
    var frameSize: CGFloat = 70
    
    var columns1: [GridItem] = Array(repeating: .init(.fixed(70)), count: 4)
    
    @State var mfgs:[String] = []
    @State var new = ""
    
    @State var strResult: String = ""
    
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    
    @State private var isHidden = true
    
    @State private var showingAlert = false
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                if end == true {
                    Image(systemName: "equal.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                
#if os(iOS)
                Text(String(Histry)).frame(height:120)
                    .font(.system(size: 50, weight: .black, design: .rounded))
                    .lineLimit(2)
                    .minimumScaleFactor(0)
                    .padding()
#else
                Text(String(Histry))
                    .font(.system(size: 100, weight: .black, design: .rounded))
                    .lineLimit(2)
                    .minimumScaleFactor(0)
                    .padding()
#endif
                
                
                if plus == true {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                } else if minus == true {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                } else if times == true {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                } else if divide == true {
                    Image(systemName: "divide.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }.padding()
            
            if !isHidden {
                Text(String(x)).hidden()
                Text(String(y)).hidden()
                
            }
            
            LazyVGrid (columns: columns1, alignment: .center, spacing: 10){
                Group {
                    ForEach(1..<4) { num in
                        Button {
                            self.end = false
                            if plus == true || minus == true || times == true || divide == true {
                                if editing == true {
                                    y2 = y * 10
                                    self.Histry = y2 + num
                                    y = Histry
                                } else {
                                    self.Histry = num
                                    self.x = num
                                    plus = false
                                    minus = false
                                    times = false
                                    divide = false
                                }
                            } else {
                                if editing == true {
                                    x2 = x * 10
                                    self.Histry = x2 + num
                                    x = Histry
                                } else {
                                    self.editing = true
                                    self.Histry = num
                                    self.x = num
                                }
                            }
                        } label: {
                            Image(systemName: "\(num).circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: frameSize, height: frameSize)
                                .foregroundColor(Color.green)
                        }
                    }
                    
                    Button {
                        self.plus = false
                        self.minus = false
                        self.times = false
                        self.end = false
                        
                        if divide == true {
                            self.divide = false
                        } else {
                            self.divide = true
                        }
                        
                    } label: {
                        Image(systemName: "divide.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                    }.keyboardShortcut("/")
                }
                
                Group {
                    ForEach(4..<7) { num in
                        Button {
                            self.end = false
                            if plus == true || minus == true || times == true || divide == true {
                                if editing == true {
                                    y2 = y * 10
                                    self.Histry = y2 + num
                                    y = Histry
                                } else {
                                    self.Histry = num
                                    self.x = num
                                    plus = false
                                    minus = false
                                    times = false
                                    divide = false
                                }
                            } else {
                                if editing == true {
                                    x2 = x * 10
                                    self.Histry = x2 + num
                                    x = Histry
                                } else {
                                    self.editing = true
                                    self.Histry = num
                                    self.x = num
                                }
                            }
                        } label: {
                            Image(systemName: "\(num).circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: frameSize, height: frameSize)
                                .foregroundColor(Color.green)
                        }
                    }
                    
                    Button {
                        self.plus = false
                        self.minus = false
                        self.divide = false
                        self.end = false
                        
                        if times == true {
                            self.times = false
                        } else {
                            self.times = true
                        }
                        
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                    }.keyboardShortcut("*")
                }
                
                Group {
                    ForEach(7..<10) { num in
                        Button {
                            self.end = false
                            if plus == true || minus == true || times == true || divide == true {
                                if editing == true {
                                    y2 = y * 10
                                    self.Histry = y2 + num
                                    y = Histry
                                } else {
                                    self.Histry = num
                                    self.x = num
                                    plus = false
                                    minus = false
                                    times = false
                                    divide = false
                                }
                            } else {
                                if editing == true {
                                    x2 = x * 10
                                    self.Histry = x2 + num
                                    x = Histry
                                } else {
                                    self.editing = true
                                    self.Histry = num
                                    self.x = num
                                }
                            }
                        } label: {
                            Image(systemName: "\(num).circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: frameSize, height: frameSize)
                                .foregroundColor(Color.green)
                        }
                    }
                    
                    Button {
                        
                        self.plus = false
                        self.times = false
                        self.divide = false
                        self.end = false
                        
                        if minus == true {
                            self.minus = false
                        } else {
                            self.minus = true
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                    }.keyboardShortcut("-")
                    
                }
                Group {
                    
                    Button {
                        self.end = false
                        self.Histry *= -1
                    } label: {
                        Image(systemName: "plusminus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.orange)
                    }
                    
                    Button {
                        self.end = false
                        if plus == true || minus == true || times == true || divide == true {
                            if editing == true {
                                y2 = y * 10
                                self.Histry = y2 + 0
                                y = Histry
                            } else {
                                self.Histry = 0
                                self.x = 0
                                plus = false
                                minus = false
                                times = false
                                divide = false
                            }
                        } else {
                            if editing == true {
                                x2 = x * 10
                                self.Histry = x2 + 0
                                x = Histry
                            } else {
                                self.editing = true
                                self.Histry = 0
                                self.x = 0
                            }
                        }
                        
                    } label: {
                        Image(systemName: "0.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.green)
                    }
                    
                    Button {
                        self.end = false
                        if plus == true || minus == true || times == true || divide == true {
                            if editing == true {
                                self.Histry = Int.random(in: -1000...1000)
                                y = Histry
                            } else {
                                self.Histry = Int.random(in: -1000...1000)
                                self.x = Int.random(in: -1000...1000)
                                plus = false
                                minus = false
                                times = false
                                divide = false
                            }
                        } else {
                            if editing == true {
                                self.Histry = Int.random(in: -1000...1000)
                                x = Histry
                            } else {
                                self.editing = true
                                self.Histry = Int.random(in: -1000...1000)
                                self.x = Int.random(in: -1000...1000)
                            }
                        }
                    } label: {
                        Image(systemName: "shuffle.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.orange)
                    }
                    
                    Button {
                        self.minus = false
                        self.times = false
                        self.divide = false
                        self.end = false
                        
                        if plus == true {
                            self.plus = false
                        } else {
                            self.plus = true
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                    }.keyboardShortcut("+")
                }
                
                Group {
                    
                    Button {
                        self.plus = false
                        self.minus = false
                        self.times = false
                        self.divide = false
                        self.end = false
                        self.Histry = 0
                        self.x = 0
                        self.x2 = 0
                        self.y = 0
                        self.y2 = 0
                        
                    } label: {
                        Image(systemName: "c.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.gray)
                    }.keyboardShortcut("c")
                    
                    Button {
                        self.end = false
                        if plus == true || minus == true || times == true || divide == true {
                            
                            if editing == true {
                                y2 = 0
                                self.Histry = 0
                                y = Histry
                            }
                        } else {
                            if editing == true {
                                x2 = 0
                                self.Histry = 0
                                x = Histry
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.left.to.line.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.gray)
                    }.keyboardShortcut(.delete)
                    
                    Button {
                        self.end = false
                        if plus == true || minus == true || times == true || divide == true {
                            if editing == true {
                                if Histry > 9 {
                                    strResult = "\(Histry)"
                                    self.strResult.removeLast()
                                    y = NumberFormatter().number(from: strResult) as! Int
                                    result = y
                                    Histry = result
                                } else {
                                    y = 0
                                    self.Histry = 0
                                    y = Histry
                                }
                                
                            }
                        } else {
                            if editing == true {
                                if Histry > 9 {
                                    strResult = "\(Histry)"
                                    self.strResult.removeLast()
                                    x = NumberFormatter().number(from: strResult) as! Int
                                    result = x
                                    Histry = result
                                } else {
                                    x = 0
                                    self.Histry = 0
                                    x = Histry
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.gray)
                    }
                    
                    Button {
                        self.end = true
                        if plus == true {
                            self.Histry = x + y
                        } else if minus == true {
                            self.Histry = x - y
                        } else if times == true {
                            self.Histry = x * y
                        } else if divide == true {
                            if y == 0 {
                                self.Histry = 0
                            } else {
                                self.Histry = x / y
                            }
                        }
                        self.plus = false
                        self.minus = false
                        self.times = false
                        self.divide = false
                        self.x = 0
                        self.y = 0
                        self.x = Histry
                        self.strResult = String(Histry)
                        self.mfgs.append(self.strResult)
                        self.new = ""
                    } label: {
                        
                        Image(systemName: "equal.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frameSize, height: frameSize)
                            .foregroundColor(Color.purple)
                    }.keyboardShortcut(.defaultAction)
                }
            }
            HStack{
                Button {
                    self.showingSheet.toggle()
                } label: {
                    HStack{
                        Image(systemName: "clock.arrow.circlepath")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("履歴")
                            .font(.headline)
                            .bold()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(25)
                }
                .keyboardShortcut("R")
                .padding()
                .sheet(isPresented: $showingSheet) {
                    VStack{
                        HStack {
                            Button {
                                self.showingSheet.toggle()
                            } label: {
                                Text("閉じる")
                                    .bold()
                            }
                            Spacer()
                            Text("履歴")
                                .bold()
                            Spacer()
                            if mfgs.isEmpty {
                                HStack {
                                    Text(Image(systemName: "square.and.arrow.up")).bold()
                                    Text("共有").bold()
                                }.foregroundColor(Color.gray)
                            } else {
                                ShareLink(items: mfgs) {
                                    HStack {
                                        Text(Image(systemName: "square.and.arrow.up")).bold()
                                        Text("共有").bold()
                                    }
                                }
                            }
                        }
                        TextField("メモを追加", text: $new)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit({
                                if new == "" {
                                    
                                } else {
                                    self.mfgs.append(self.new)
                                    self.new = ""
                                }
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        List {
                            HStack {
                                Text(Image(systemName: "text.bubble.fill"))
                                Text("履歴はAppを終了すると消去されます")
                            }.font(.callout)
                            
                            ForEach(mfgs, id: \.self) { user in
                                Text(user)
                            }
                            .onDelete(perform: rowRemove)
                        }.listStyle(.plain)
                        
                        Button {
                            self.showingAlert = true
                        } label: {
                            HStack{
                                Image(systemName: "flame.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                Text("リセット")
                                    .font(.headline)
                                    .bold()
                            }
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(25)
                        }.alert("消去", isPresented: $showingAlert){
                            Button("Yes", role: .destructive){
                                self.plus = false
                                self.minus = false
                                self.times = false
                                self.divide = false
                                self.end = false
                                self.Histry = 0
                                self.x = 0
                                self.x2 = 0
                                self.y = 0
                                self.y2 = 0
                                self.result = 0
                                self.mfgs.removeAll()
                                self.showingSheet.toggle()
                            }
                        } message: {
                            Text("履歴と計算中の項目を消去しますか？")
                        }
                        
                    }
                    .padding()
                }
                
            }
        }
    }
    
    func rowRemove(offsets: IndexSet) {
        mfgs.remove(atOffsets: offsets)
    }
}

