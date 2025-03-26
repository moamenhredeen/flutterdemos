# demos

## MVVM Based Approach for State Management

this approach is recommended by the flutter team. so if this is the recommended approach, why is it not the norm ?
while it is a clean architecture, it does not solve the core state management problem, which is to share a state between 
multiple unrelated components.

for example in this very simple app, we see that it is not possible to share the state between the inbox screen and the bottom
navigation bar (show the number of items in inbox page as badge on the inbox icon in the bottom navigation bar). It is not that 
hard to get the inbox state in the bottom navigation bar, but it not easy to make the state of the bottom navigation bar updates
when a new item add to the inbox.

I also do not think that mvvm is a good fit for flutter. In mvvm architecture the view model is the holder of the state of the view, 
which is not how flutter works. Flutter widgets represent the view and view model in the mvvm. we could argue that we want persist
data when the view is rebuilt, but for that we could use external state.

Nevertheless, I do like this approach of structuring the code, it does feel much better (more organized, more intuitive, ...) 
than most approaches like Riverpod, BloC, etc.

Until i find a good way to share data in a reactive way between mvvm without code duplication and a lot of boilerplate, i think
riverpod will be a safer pet.