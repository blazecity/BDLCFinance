import unittest
import msciworlddata

class TestMSCIWorldData(unittest.TestCase):

    def test_load_ticker_symbols(self):
        self.assertEqual(len(msciworlddata.load_ticker_symbols("ticker_test.json")), 8)

if __name__ == '__main__':
    unittest.main()
