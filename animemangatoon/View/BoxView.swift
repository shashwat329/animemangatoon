//
//  BoxView.swift
//  animemangatoon
//
//  Created by shashwat singh on 11/10/24.
//
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let imageUrl: String
    let title: String
}

struct BoxView: View {
    @State private var selectedCard: Card? = nil
    @State private var showFullScreen = false
    let cards: [Card] = [
        Card(imageUrl: "https://cdn.pixabay.com/photo/2022/03/10/11/10/venom-7059662_1280.png", title: "Venom : a true symbiote "),
        Card(imageUrl: "https://m.media-amazon.com/images/S/pv-target-images/81ef275effa427553a847bc220bebe1dc314b2e79d00333f94a6bcadd7cce851._SX1080_FMjpg_.jpg", title: "Card 2"),
        Card(imageUrl: "https://cdn.marvel.com/content/1x/005smp_ons_cut_dsk_01_5.jpg", title: "Card 3"),
        Card(imageUrl: "https://static.dc.com/2023-03/dc_superman_hub_4up_Community_1x1.jpg?w=900", title: "Card 4"),
        Card(imageUrl: "https://cdn.pixabay.com/photo/2022/03/10/11/10/venom-7059662_1280.png", title: "Card 5")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(cards) { card in
                        // Each card view
                        CardView(card: card)
                            .onTapGesture {
                                selectedCard = card
                                showFullScreen.toggle() // Open full-screen on tap
                            }
                            .padding()
                    }
                }
            }
            .fullScreenCover(item: $selectedCard) { card in
                FullScreenCardView(card: card)
            }
        }
    }
}

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack (alignment: .bottom){
            // AsyncImage for loading image from a URL
            AsyncImage(url: URL(string: card.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 300, height: 200)
                    .cornerRadius(10)
                    .clipped()
            } placeholder: {
                // Placeholder while loading the image
                ProgressView()
                    .frame(width: 300, height: 200)
            }
            Rectangle()
                .opacity(0.1)
                .background(Color.white.opacity(0.9))
                .frame(height: 60)
                .cornerRadius(5)
            // Overlay title on the image
            HStack{
                VStack(alignment:.leading){
                    Text(card.title)
                        .font(.headline)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text("Rating: 4")
                }
                .padding()
                
                Image(systemName: "heart")
                    .padding()
            }
            
        }
        .shadow(radius: 5)
    }
}

struct FullScreenCardView: View {
    var card: Card
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(){
            ZStack(alignment: .topTrailing) {
                // Full screen image with AsyncImage
                AsyncImage(url: URL(string: card.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                // Close button
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the full-screen modal
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
    //                    .padding()
                }
                
            }
            Text(card.title)
                .font(.largeTitle)
            ScrollView{
                Text("chjsdkjfsf casdkhf kashdkf haskdhfk asdhfka hdskffk sdhkfsadfasd  kfhkahsdf   sfhiasdhfjah  sdjfha  sdjfa sdj asdfi ha sdfjha  sdhdfkasdh ahsfihasd jkaskd hfkasdh kahsdf  ihasdk fhaiksd aisdhfia sdhf ksdhfias hsdfih asdjkf hasdi fhasdih hsdifhsa dihfajsd hias sdhfias hdfsdkjf hskdfh jkadshf sahjs dkhfasdj fsdhasdf iahsdfju asd hsdfhjik sdfhjksd dhcia sdjhkjsah sfkuasdfd hasdfadskh  faisuhd asdi hfiashdfads ahsdifhasdi fhisduyfas shfia sdyfias chjsdkjfsf casdkhf kashdkf haskdhfk asdhfka hdskffk sdhkfs adfasd  kfhkahsdf   sfhiasdhfjah  sdjfha  sdjfa sdj asdfi ha sdfjha  sdhdfkasdh ahsfihasd jkaskd hfkasdh kahsdf  ihasdk fhaiksd aisdhfia sdhf ksdhfias hsdfih asdjkf hasdi fhasdih hsdifhsa dihfajsd hias sdhfias hdfsdkjf hskdfh jkadshf sahjs dkhfasdj fsdhasdf iahsdfju asd hsdfhjik sdfhjksd dhcia sdjh  kjsah sfku asdfd has dfadskh  faisuhd asdi hfiashdfads ahsdifhasdi fhisduyfas shfia sdyfias chjsdkjfsf casdkhf kashdkf haskdhfk asdhfka hdskffk sdhkfsadfasd  kfhkahsdf   sfhiasdhfjah  sdjfha  sdjfa sdj asdfi ha sdfjha  sdhdfkasdh ahsfihasd jkaskd hfkasdh kahsdf  ihasdk fhaiksd aisdhfia sdhf ksdhfias hsdfih asdjkf hasdi fhasdih hsdifhsa dihfajsd hias sdhfias hdfsdkjf hskdfh jkadshf sahjs dkhfasdj fsdhasdf iahsdfju asd hsdfhjik sdfhjksd dhcia sdjhkjsah sfkuasdfd hasdfadskh  faisuhd asdi hfiashdfads ahsdifhasdi fhisduyfas shfia sdyfias")
                    .padding(.horizontal)
                
                
            }
                
        }
        
        Spacer()
    }
}

#Preview {
    BoxView()
}
