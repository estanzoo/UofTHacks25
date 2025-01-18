//
//  GroupPage.swift
//  RingOrPing
//
//  Created by Me on 2025-01-18.
//

import SwiftUI
import UIKit

let buttonColor: Color = Color("Light2")

struct GroupView: View
{
    var body: some View
    {
        VStack (spacing: 0)
        {
            HStack (spacing: 0)
            {
                //Spacer().frame(width: 5, height: 1)
                Button(action: {
                    print("pp")
                })
                {
                    ZStack ()
                    {
                        Rectangle().frame(width: 180, height: 60).foregroundColor(buttonColor).cornerRadius(20)
                        Text("Create").padding(.vertical, 10).padding(.horizontal, 30).font(.system(size: 24)).foregroundStyle(.extraDark)
                    }
                }
                Spacer().frame(width: 20, height: 1)
                Button(action: {
                    print("poo")
                })
                {
                    ZStack()
                    {
                        Rectangle().frame(width: 180, height: 60).foregroundColor(buttonColor).cornerRadius(20)
                        Text("Join").padding(.vertical, 10).padding(.horizontal, 30).font(.system(size: 24)).foregroundStyle(.extraDark)
                    }
                }
                //Spacer().frame(width: 5, height: 1)
            }
            Spacer().frame(height: 10)
            Rectangle().frame(height: lineWidth).foregroundStyle(.white)
            ForEach(1...5, id: \.self)//replace 5 with number of groups
            { i in
                Button(action: {
                    print("diarrhea")
                })
                {
                    ZStack (alignment: .topLeading)
                    {
                        if (i % 2 == 1)
                        {
                            Rectangle().frame(height:60).foregroundColor(Color(red: 29/255.0, green: 133/255.0, blue: 121/255.0))
                        }
                        else
                        {
                            Rectangle().frame(height:60).foregroundColor(Color(red: 12/255.0, green: 17/255.0, blue: 15/255.0))
                        }
                        Text ("INSERT GROUP NAME").font(.system(size: 24)).foregroundStyle(.white).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5).padding(.top, 5)
                        Text ("INSERT GROUP NUMBER").font(.system(size: 16)).foregroundColor(Color(red: 183/255.0, green: 192/255.0, blue: 238/255.0)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 10).padding(.top, 35)
                    }
                }
            }
            Spacer()
        }
    }
}
