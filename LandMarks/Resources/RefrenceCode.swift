//
//  RefrenceCode.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import Foundation

//        VStack {
//            GeometryReader { geometry in
//                MapView()
//                    .ignoresSafeArea(edges: .top)
//                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.8,alignment: .center)
//
//            }
//            GeometryReader {
//                geometry in
//                CircleImage()
//                    .frame(width: geometry.size.width*0.94,height: geometry.size.height*0.1, alignment: .center)
//            }
//            Text("TIGER HABITAT")
//                .foregroundColor(.green)
//                .font(.largeTitle)
//
//            HStack {
//                Text("Jim Corbett National Park")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                Spacer()
//                Text("Uttrakhand")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//            }
//
//            Divider()
//            Text("About Jim Corbett")
//                .foregroundColor(.purple)
//                .font(.headline)
//
//            Text("Jim Corbett National Park is one of the best and the oldest habitats for tigers in the Himalayan region. It has the unique distinction of being the place where the famous project called the “Project tiger” or “operation Tiger” was launched in 1973.What makes Jim Corbett a fascinating place to visit is its rich variety of flora and fauna, soothing climate, fairytale-like landscapes and exotic wildlife. It is a perfect destination for wildlife holidays in India. It is the best tiger reserve to enjoy wildlife tourism. ")
//                .foregroundColor(.secondary)
//        }
//        .onAppear(perform: {
//            var x : [Landmark] = loadLandmarksArray("landmarkData.json")
//        })
//        .padding()
//        Spacer()




//struct CircleImage: View {
//    var image : Image
//    
//    var body: some View {
//        Image("turtlerock")
//        .clipShape(Circle())
//        //.border(.green)     gives square border along the text or images ......
//        .overlay(Circle().stroke(Color.white, lineWidth: 11))
//        // code to give stroke with color and border line width.......
//        .shadow(radius: 7)
//        // decent design for images......
//}
//}

//struct CircleImage_Previews: PreviewProvider {
//static var previews: some View {
//    CircleImage()
//
//}
//}

   // Category Item code for display image of landmark.
//               landmark.image
//                .renderingMode(.original)
//                .resizable()
//                .frame(width: 150,height: 140)
//                .cornerRadius(10)
//                .shadow(color: .green, radius: 2,x: 0,y: 5)
