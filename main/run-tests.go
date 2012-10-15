/*
Copyright (c) 2012 Matthias S. Benkmann

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, 
MA  02110-1301, USA.
*/

// Runs the go-susi unit tests.

package main

import ( 
         "os"
         "fmt"
         "strings"
         
         "../tests"
       )

var gosasi = false

func main() {
  systemtest := ""
  for i:=1 ; i < len(os.Args) ; i++ {
    if os.Args[i] == "-v" { tests.Show_output=true }
    if strings.HasPrefix(os.Args[i],"--system=") { systemtest = os.Args[i][9:] }
    if os.Args[i] == "--gosa-si" { gosasi = true }
  }

  if systemtest != "" {
    tests.SystemTest(systemtest, gosasi)
  } else
  {
    tests.Util_test()
    tests.Xml_test()
  }
  
  // TODO: Test go-susi
  // 1. Use exec to start a slapd listening on 127.0.0.1:35682 using slapd.conf and
  //    database in tests/  (the database is copied from a master file before the test
  //    so that each test starts with a fresh database)
  // 2. Use exec to start go-susi with a config file provided in tests/ that uses
  //    port 35681 instead of 20081 and runs queries against the local slapd and 
  //    logs into tests/go-susi.log
  // 3. Run tests
  // 4. Kill the slapd and go-susi processes
  
  // -----------------------------------------
  fmt.Printf("\n=== Results ===\n\n#Tests: %3v\nPassed: %3v (%v unexpected)\nFailed: %3v (%v expected)\n", 
  tests.Count, tests.Pass, tests.UnexpectedPass, tests.Fail, tests.ExpectedFail)
  
  fmt.Printf("\nPass '-v' on the command line to see test output\nPass --system=<host>:<port> to test a running daemon\nPass --system=<programpath> to start daemon <programpath> and test it\nPass --gosa-si if the server to test is a gosa-si\n\n")
}
