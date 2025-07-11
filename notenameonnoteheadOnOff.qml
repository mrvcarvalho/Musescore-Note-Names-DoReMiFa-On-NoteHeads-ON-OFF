//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Note Names Plugin (ON/OFF) (toggle note names color white/black)
//
//  Copyright (C) 2025 Marvel Carvalho
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2
//  as published by the Free Software Foundation and appearing in
//  the file LICENCE.GPL
//=============================================================================

import QtQuick 2.2
import MuseScore 3.0

MuseScore {
   version: "4.0"
   description: "This plugin names notes as per your language setting"
   title: "Note Names DoReMiFa On NoteHeads (ON/OFF)"
   menuPath: "Plugins.Notes." + "Note Names DoReMi (On/Off)"
   categoryCode: "composing-arranging-tools"
   thumbnailName: "notenameonnoteheadOnOff.png"
   
   // Small note name size is fraction of the full font size.
   property real fontSizeMini: 0.4;

   id: noteNamesDoReMi

   Component.onCompleted : {
      if (mscoreMajorVersion >= 4) {
         noteNames.title = "Note Names DoReMi (On/Off)"
         noteNames.categoryCode = "composing-arranging-tools"
         noteNames.thumbnailName = "notenameonnoteheadOnOff.png"
      }
   }

   function nameChord (notes, text, small) {
         text.text = "X";
   }

   function logDebug (debugMsg, cursor){
      var debugText = newElement(Element.STAFF_TEXT);      // Make a new "TEXT"
      debugText.text = debugMsg;
      debugText.fontSize = 3.5;
      cursor.add(debugText);
   }

   // Função auxiliar para verificar se um texto corresponde a um nome de nota em Do-Re-Mi.
   // Isso é crucial para distinguir os nomes de notas adicionados de outros elementos de dedilhado.
   function isNoteNameDoReMi(text) {
        if (!text) return false;
        // Regex que corresponde aos nomes de notas em Do-Re-Mi, com ou sem acidentes (b, bb, #, ##).
        // Caracteres Unicode ♭ (flat) e ♯ (sharp) são usados para maior precisão.
        // O 'i' no final torna a busca case-insensitive.
        var noteNameRegex = /^(do|re|mi|fa|sol|la|si)(?:♭♭|♭|♯♯|♯)?$/i;
        return noteNameRegex.test(text);
   }
   
  
   onRun: {
      curScore.startCmd()

      var cursor = curScore.newCursor();
      var startStaff;
      var endStaff;
      var endTick;
      var fullScore = false;
      cursor.rewind(1);
      if (!cursor.segment) { // no selection
         fullScore = true;
         startStaff = 0; // start with 1st staff
         endStaff  = curScore.nstaves - 1; // and end with last
      } else {
         startStaff = cursor.staffIdx;
         cursor.rewind(2);
         if (cursor.tick === 0) {
            // this happens when the selection includes
            // the last measure of the score.
            // rewind(2) goes behind the last segment (where
            // there's none) and sets tick=0
            endTick = curScore.lastSegment.tick + 1;
         } else {
            endTick = cursor.tick;
         }
         endStaff = cursor.staffIdx;
      }
      console.log(startStaff + " - " + endStaff + " - " + endTick)

      var removedCount = 0; // Contador de elementos removidos

      for (var staff = startStaff; staff <= endStaff; staff++) {
         for (var voice = 0; voice < 4; voice++) {
            cursor.rewind(1); // beginning of selection
            cursor.voice    = voice;
            cursor.staffIdx = staff;

            if (fullScore)  // no selection
               cursor.rewind(0); // beginning of score

            //logDebug("1", cursor);

            while (cursor.segment && (fullScore || cursor.tick < endTick)) {

               if (cursor.element && cursor.element.type === Element.CHORD) {
                  var chord = cursor.element;

                  // Itera sobre todos os elementos filhos do acorde
                  for (var i = 0; i < chord.notes.length; ++i) {

                     var note = chord.notes[i];
                      
                     if (!note.elements) continue;

                     for (var j = 0; j < note.elements.length; j++) {
                           var el = note.elements[j];
                           // Verifica se é um FINGERING E se o texto é um nome de nota em Do-Re-Mi
                           if (el && el.type === Element.FINGERING && isNoteNameDoReMi(el.text)) {
                              //chord.remove(el)
                              //el.visible = !el.visible;
                              if (el.color == "#ffffff") {el.color = "#000000";}
                              else if (el.color == "#000000") {el.color = "#ffffff";}
                           }
                     }
                     
                  }
               } // end if CHORD
               cursor.next();
            } // end while segment
         } // end for voice
      } // end for staff

      curScore.endCmd()
      quit();
   } // end onRun
}
