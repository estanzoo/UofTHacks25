//
//  GroupListPopUp.swift
//  RingOrPing
//
//  Created by Guest User on 2025-01-19.
//

import SwiftUI
import UIKit

struct GListView: View
{
    @State var textBox: String = ""
    @Binding var gListP: Bool
    var body: some View
    {
        ZStack ()
        {
            Button(action: {
                gListP = false
            })
            {
                Rectangle().opacity(0.5).foregroundStyle(.black)
            }
            VStack()
            {
                Spacer()
                HStack()
                {
                    Spacer()
                    ZStack()
                    {
                        Rectangle().frame(width: 360, height: 610).foregroundStyle(Color("Light1")).cornerRadius(20)
                        Rectangle().frame(width: 350, height: 600).foregroundStyle(.black).cornerRadius(20)
                        VStack(spacing: 0)
                        {
                            Spacer().frame(height: 140)
                            Text("Group Name").font(.system(size: 30)).foregroundStyle(.white)
                            Spacer().frame(height: 1)
                            Text("# members").font(.system(size: 20)).foregroundStyle(.white)
                            Spacer().frame(height:1)
                            Text("ID: XXXXX").font(.system(size: 24)).foregroundStyle(.white)
                            ZStack()
                            {
                                Spacer()
                                VStack()
                                {
                                    ForEach(1...5, id: \.self)//replace 5 with number of groups
                                    { i in
                                        ZStack (alignment: .topLeading)
                                        {
                                            HStack()
                                            {
                                                if (i % 2 == 1)
                                                {
                                                    Rectangle().frame(width: 350, height: 50).foregroundColor(Color(red: 29/255.0, green: 133/255.0, blue: 121/255.0))
                                                }
                                                else
                                                {
                                                    Rectangle().frame(width: 350, height: 50).foregroundColor(.white)
                                                }
                                            }
                                            Text("Name").font(.system(size: 24)).foregroundStyle(.black).padding(.top, 10).padding(.leading, 10)
                                            Spacer()
                                            /*HStack()
                                            {
                                                Text("Name").font(.system(size: 24)).foregroundStyle(.black).padding(.top, 10).padding(.leading, 10)
                                                Spacer()
                                                Text("10:00AM").foregroundStyle(.black).font(.system(size:24))
                                                Spacer().frame(width: 50)
                                            }*/
                                        }
                                    }
                                }
                                
                            }
                            Spacer()
                            VStack(spacing: 0)
                            {
                                Spacer().frame(height: 25)
                                ZStack()
                                {
                                    Button(action: {
                                        print ("ppp")
                                    })
                                    {
                                        Rectangle().frame(width: 140, height: 40).foregroundStyle(.red).cornerRadius(20)
                                    }
                                    Text("Leave").foregroundStyle(.black).font(.system(size: 24))
                                }
                            }
                            Spacer().frame(height: 150)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
