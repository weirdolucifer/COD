class Automaton:
    def __init__(self, nstates):
        self.transitions = [{} for i in range(nstates)]
        self.accept_states = [False] * nstates

    def register(self, source_state, char, target_state):
        self.transitions[source_state][char] = target_state

    def register_accept(self, state):
        self.accept_states[state] = True

    def accept(self, input):
        state = 0
        try:
            for char in input:
                state = self.transitions[state][char]
            return self.accept_states[state]
        except KeyError:
            return False
          
# add your keywords and texts here
keyword=["if ","while ","then ","do ","for ","else ","goto ","break ","malloc ","return "]
texts=["while","gautham","if","do"]

# checking 
for text in texts:
    for key in keyword:
        automaton= Automaton(len(key))
        i=0
        for k in key:
            automaton.register(i,k,i+1)
            i=i+1
        automaton.register_accept(len(key)-1)
        if automaton.accept(text):
            print "keyword detected : " + text
