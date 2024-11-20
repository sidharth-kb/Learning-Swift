//
//  ContentView.swift
//  Todo-List
//
//  Created by Sidharth Biju on 20/11/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = TaskSection.all

    @State private var allTasks = Task.examples()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()

    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: userCreatedGroups, selection: $selection)
        } detail: {
            switch selection {
                case .all:
                    TaskListView(title: "All", tasks: allTasks)
                case .done:
                    TaskListView(title: "All", tasks: allTasks.filter({ $0.isCompleted }))
                case .upcoming:
                    TaskListView(title: "All", tasks: allTasks.filter({ !$0.isCompleted }))
                case .list(let taskGroup):
                    TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
