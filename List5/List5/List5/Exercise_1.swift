//
//  Exercise_1.swift
//  List5
//
//  Created by Jakub Tokarski on 16/03/2025.
//

import SwiftUI
import UserNotifications

func requestNotificationPermissions() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("Permission granted!")
        } else if let error = error {
            print("Permission denied: \(error)")
        }
    }
}

func scheduleReminder() {
    let content = UNMutableNotificationContent()
    content.title = "Przypominajka!"
    content.subtitle = "Spotkanie za 20 minut!"
    content.body = "Nie zapomnij wziąć ze sobą kawy!"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling reminder: \(error)")
        }
    }
    
}
struct Exercise_1: View {
    
    @State private var isShowingBasicAlert = false
    @State private var isShowingActionSheet = false
    @State private var isShowingDestructiveAlert = false
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Click me!") {
                isShowingBasicAlert = true
            }
            .alert("No Network!", isPresented: $isShowingBasicAlert){
                
            } message: {
                Text("No network detected! Please check your router settings and try again!")
            }
            .buttonStyle(CustomAlertButtonStyle())
            
            Button("Click me!") {
                isShowingActionSheet = true
            }
            .actionSheet(isPresented: $isShowingActionSheet) {
                ActionSheet(
                        title: Text("Wybierz opcję"),
                        message: Text("To jest przykładowe action sheet."),
                            buttons: [
                                  .default(Text("Opcja 1")),
                                  .default(Text("Opcja 2")),
                                  .cancel()
                              ]
                            )
            }
            .buttonStyle(CustomAlertButtonStyle())
            
            Button("Click me!") {
                isAlertPresented = true
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(
                        title: Text("Czy na pewno chcesz usunąć dane?"),
                        primaryButton: .destructive(Text("Usuń")) {
                                     print("Dane zostały usunięte!")
                                 },
                        secondaryButton: .cancel(Text("Anuluj"))
                    )
            }
            .buttonStyle(CustomAlertButtonStyle())

            Button("Click me!") {
                scheduleReminder()
            }
            .buttonStyle(CustomAlertButtonStyle())

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.6, green: 0.6, blue: 1.0)
            .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            requestNotificationPermissions()
        }
    }
}

struct CustomAlertButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.red.opacity(1.0))
            .padding()
            .background(Color.white.opacity(0.5))
            .clipShape(Capsule())
    }
}

#Preview {
    Exercise_1()
}


