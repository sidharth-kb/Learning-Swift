//
//  TaskListView.swift
//  Todo-List
//
//  Created by Sidharth Biju on 20/11/2024.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    let tasks: [Task]

    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: Task.examples())
}
