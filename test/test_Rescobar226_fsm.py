from tt_test import BaseTestCase

class TestFSM(BaseTestCase):
    def test_fsm_secuencia(self):
        self.poke("ena", 1)
        self.poke("clk", 0)
        self.poke("rst_n", 0)
        self.step()

        self.poke("rst_n", 1)
        self.step()

        # Estado inicial: S=1, LC=1
        self.set_ui(0b1001)  # Sen=1, LC=1
        self.toggle_clk()
        print("MA/MC/S:", bin(self.peek_uo()))

        # Estado s1: LA=1
        self.set_ui(0b0100)  # LA=1
        self.toggle_clk()
        print("MA/MC/S:", bin(self.peek_uo()))

        # Estado s2: S=0, LA=1
        self.set_ui(0b0100)
        self.toggle_clk()
        print("MA/MC/S:", bin(self.peek_uo()))

        # Estado s3: SE=1
        self.set_ui(0b0010)
        self.toggle_clk()
        print("MA/MC/S:", bin(self.peek_uo()))

        self.done()
