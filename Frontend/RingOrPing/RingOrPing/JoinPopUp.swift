//
//  JoinPopUp.swift
//  RingOrPing
//
//  Created by Guest User on 2025-01-19.
//

import SwiftUI
import UIKit

struct JoinView: View
{
    @State var textBox: String = ""
    @Binding var joinP: Bool
    var body: some View
    {
        ZStack ()
        {
            Button(action: {
                joinP = false
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
                        Rectangle().frame(width: 310, height: 210).foregroundStyle(Color("Light1")).cornerRadius(20)
                        Rectangle().frame(width: 300, height: 200).foregroundStyle(.black).cornerRadius(20)
                        VStack(spacing: 0)
                        {
                            TextField("Group ID", text:$textBox, prompt: Text("Group ID").foregroundStyle(.white))
                                .padding()
                                .font(.system(size: 30, weight: .bold))
                                .padding(.horizontal)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            VStack(spacing: 0)
                            {
                                Spacer().frame(height: 25)
                                ZStack()
                                {
                                    Button(action: {
                                        print ("pppp")
                                    })
                                    {
                                        Rectangle().frame(width: 140, height: 40).foregroundStyle(.red).cornerRadius(20)
                                    }
                                    Text("Join").foregroundStyle(.black).font(.system(size: 24))
                                }
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
