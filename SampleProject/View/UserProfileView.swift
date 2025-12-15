//
//  UserProfileView.swift
//  SampleProject
//
//  Created by Arpit Verma on 12/15/25.
//

import SwiftUI

struct UserProfileView: View {
    @State var user : UserModal
    @State var isExpanded: Bool = false
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 12) {
        
            AsyncImage(url: URL(string: user.image?.url ?? "")) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
            } placeholder: {
                Circle()
                    .frame(width: 40, height: 40)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(user.title)
                    .font(.system(size: 14,weight: .bold))
                    .foregroundColor(Color.black)
                if isExpanded {
                    Text(user.description)
                        .font(.system(size: 10,weight: .bold))
                        .foregroundColor(Color.black.opacity(0.6))
                }
            }
            
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .stroke(Color.black.opacity(0.6), lineWidth: 0.5
        )
            )
        .onTapGesture {
            isExpanded.toggle()
        }
        
        
        
    }
}



#Preview {
    UserProfileView(
        user: UserModal(title: "Sample Item 1", description: "This is a sample description for item number 1. It contains general information about the content and purpose of this particular entry in the JSON list.", image: ImageModal(url: "https://picsum.photos/id/1/600/400", type: "image"))
    )
}
