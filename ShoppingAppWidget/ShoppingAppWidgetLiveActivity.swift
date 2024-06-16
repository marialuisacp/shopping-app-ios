//
//  ShoppingAppWidgetLiveActivity.swift
//  ShoppingAppWidget
//
//  Created by Maria Luísa Costa Pinto on 15/06/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ShoppingAppWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ShoppingAppWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ShoppingAppWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ShoppingAppWidgetAttributes {
    fileprivate static var preview: ShoppingAppWidgetAttributes {
        ShoppingAppWidgetAttributes(name: "World")
    }
}

extension ShoppingAppWidgetAttributes.ContentState {
    fileprivate static var smiley: ShoppingAppWidgetAttributes.ContentState {
        ShoppingAppWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ShoppingAppWidgetAttributes.ContentState {
         ShoppingAppWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ShoppingAppWidgetAttributes.preview) {
   ShoppingAppWidgetLiveActivity()
} contentStates: {
    ShoppingAppWidgetAttributes.ContentState.smiley
    ShoppingAppWidgetAttributes.ContentState.starEyes
}
