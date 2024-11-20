import SwiftUI

struct SidebarView: View {

    let userCreatedGroups: [TaskGroup];
    @Binding var selection: TaskSection

    var body: some View {
        List(selection: $selection) {
            Section("Favourites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName)
                        .tag(selection)
                }

            }

            Section("Your Groups") {
                ForEach(userCreatedGroups) {group in 
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {

            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: TaskGroup.examples(), selection: .constant(.all))
        .listStyle(.sidebar)
}

