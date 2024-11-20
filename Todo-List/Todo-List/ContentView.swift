//
//  ContentView.swift
//  Todo-List
//
//  Created by Sidharth Biju on 20/11/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()

    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: userCreatedGroups)
        } detail: {
            TaskListView(title: String, tasks: [Task])
        }
    }
}

#Preview {
    ContentView()
}
