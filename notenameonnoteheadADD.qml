//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Note Names Plugin
//
//  Copyright (C) 2012 Werner Schweer
//  Copyright (C) 2013 - 2021 Joachim Schmitz
//  Copyright (C) 2014 Jörn Eichler
//  Copyright (C) 2020 Johan Temmerman
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
   title: "Note Names DoReMiFa On NoteHeads (ADD)"
   menuPath: "Plugins.Notes." + "Note Names DoReMi (Add)"
   categoryCode: "composing-arranging-tools"
   thumbnailName: "notenameonnoteheadADD.png"
   
   // Small note name size is fraction of the full font size.
   property real fontSizeMini: 0.4;

   id: noteNamesDoReMi

   Component.onCompleted : {
      if (mscoreMajorVersion >= 4) {
         noteNames.title = "Note Names DoReMi (Add)"
         noteNames.categoryCode = "composing-arranging-tools"
         noteNames.thumbnailName = "notenameonnoteheadADD.png"
      }
   }

   function nameChord (notes, text, small) {
      var sep = "\n";   // change to "," if you want them horizontally (anybody?)
      var oct = "";
      var name;
      for (var i = 0; i < notes.length; i++) {
         if (!notes[i].visible)
            continue // skip invisible notes
         if (text.text) // only if text isn't empty
            text.text = sep + text.text;
         if (small)
            text.fontSize *= fontSizeMini
         if (typeof notes[i].tpc === "undefined") // like for grace notes ?!?
            return

         switch (notes[i].tpc) {
            case -1: name = mscoreMajorVersion >= 4 ? qsTr("fa♭♭") : qsTranslate("InspectorAmbitus", "fa♭♭"); break;
            case  0: name = mscoreMajorVersion >= 4 ? qsTr("do♭♭") : qsTranslate("InspectorAmbitus", "do♭♭"); break;
            case  1: name = mscoreMajorVersion >= 4 ? qsTr("sol♭♭") : qsTranslate("InspectorAmbitus", "sol♭♭"); break;
            case  2: name = mscoreMajorVersion >= 4 ? qsTr("re♭♭") : qsTranslate("InspectorAmbitus", "re♭♭"); break;
            case  3: name = mscoreMajorVersion >= 4 ? qsTr("la♭♭") : qsTranslate("InspectorAmbitus", "la♭♭"); break;
            case  4: name = mscoreMajorVersion >= 4 ? qsTr("mi♭♭") : qsTranslate("InspectorAmbitus", "mi♭♭"); break;
            case  5: name = mscoreMajorVersion >= 4 ? qsTr("si♭♭") : qsTranslate("InspectorAmbitus", "si♭♭"); break;

            case  6: name = mscoreMajorVersion >= 4 ? qsTr("fa♭") : qsTranslate("InspectorAmbitus", "fa♭"); break;
            case  7: name = mscoreMajorVersion >= 4 ? qsTr("do♭") : qsTranslate("InspectorAmbitus", "do♭"); break;
            case  8: name = mscoreMajorVersion >= 4 ? qsTr("sol♭") : qsTranslate("InspectorAmbitus", "sol♭"); break;
            case  9: name = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/instruments:db-piccolo traitName" : "InspectorAmbitus", "re♭"); break;
            case 10: name = qsTranslate(mscoreMajorVersion >= 4 ? "EditPitchBase" : "InspectorAmbitus", "La♭"); break;
            case 11: name = qsTranslate(mscoreMajorVersion >= 4 ? "EditPitchBase" : "InspectorAmbitus", "Mi♭"); break;
            case 12: name = qsTranslate(mscoreMajorVersion >= 4 ? "EditPitchBase" : "InspectorAmbitus", "Si♭"); break;

            case 13: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "fa"); break;
            case 14: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "do"); break;
            case 15: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "sol"); break;
            case 16: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "re"); break;
            case 17: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "la"); break;
            case 18: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "mi"); break;
            case 19: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "si"); break;

            case 20: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "fa♯"); break;
            case 21: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "do♯"); break;
            case 22: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "sol♯"); break;
            case 23: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "re♯"); break;
            case 24: name = qsTranslate(mscoreMajorVersion >= 4 ? "global" : "InspectorAmbitus", "la♯"); break;
            case 25: name = mscoreMajorVersion >= 4 ? qsTr("mi♯") : qsTranslate("InspectorAmbitus", "mi♯"); break;
            case 26: name = mscoreMajorVersion >= 4 ? qsTr("si♯") : qsTranslate("InspectorAmbitus", "si♯"); break;

            case 27: name = mscoreMajorVersion >= 4 ? qsTr("fa♯♯") : qsTranslate("InspectorAmbitus", "fa♯♯"); break;
            case 28: name = mscoreMajorVersion >= 4 ? qsTr("do♯♯") : qsTranslate("InspectorAmbitus", "do♯♯"); break;
            case 29: name = mscoreMajorVersion >= 4 ? qsTr("sol♯♯") : qsTranslate("InspectorAmbitus", "sol♯♯"); break;
            case 30: name = mscoreMajorVersion >= 4 ? qsTr("re♯♯") : qsTranslate("InspectorAmbitus", "re♯♯"); break;
            case 31: name = mscoreMajorVersion >= 4 ? qsTr("la♯♯") : qsTranslate("InspectorAmbitus", "la♯♯"); break;
            case 32: name = mscoreMajorVersion >= 4 ? qsTr("mi♯♯") : qsTranslate("InspectorAmbitus", "mi♯♯"); break;
            case 33: name = mscoreMajorVersion >= 4 ? qsTr("si♯♯") : qsTranslate("InspectorAmbitus", "si♯♯"); break;
            default: name = qsTr("?")   + text.text; break;
         } // end switch tpc

         // octave, middle C being C4
         //oct = (Math.floor(notes[i].pitch / 12) - 1)
         // or
         //oct = (Math.floor(notes[i].ppitch / 12) - 1)
         // or even this, similar to the Helmholtz system but one octave up
         //var octaveTextPostfix = [",,,,,", ",,,,", ",,,", ",,", ",", "", "'", "''", "'''", "''''", "'''''"];
         //oct = octaveTextPostfix[Math.floor(notes[i].pitch / 12)];
         text.text = name + oct + text.text

// change below false to true for courtesy- and microtonal accidentals
// you might need to come up with suitable translations
// only #, b, natural and possibly also ## seem to be available in UNICODE
/*
         if (false) {
            switch (notes[i].userAccidental) {
               case  0: break;
               case  1: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp") + text.text; break;
               case  2: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat") + text.text; break;
               case  3: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Double sharp") + text.text; break;
               case  4: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Double flat") + text.text; break;
               case  5: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Natural") + text.text; break;
               case  6: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat-slash") + text.text; break;
               case  7: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat-slash2") + text.text; break;
               case  8: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Mirrored-flat2") + text.text; break;
               case  9: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Mirrored-flat") + text.text; break;
               case 10: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Mirrored-flat-slash") + text.text; break;
               case 11: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat-flat-slash") + text.text; break;
               case 12: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp-slash") + text.text; break;
               case 13: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp-slash2") + text.text; break;
               case 14: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp-slash3") + text.text; break;
               case 15: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp-slash4") + text.text; break;
               case 16: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp arrow up") + text.text; break;
               case 17: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp arrow down") + text.text; break;
               case 18: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sharp arrow both") + text.text; break;
               case 19: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat arrow up") + text.text; break;
               case 20: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat arrow down") + text.text; break;
               case 21: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Flat arrow both") + text.text; break;
               case 22: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Natural arrow down") + text.text; break;
               case 23: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Natural arrow up") + text.text; break;
               case 24: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Natural arrow both") + text.text; break;
               case 25: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Sori") + text.text; break;
               case 26: text.text = qsTranslate(mscoreMajorVersion >= 4 ? "engraving/sym" : "accidental", "Koron") + text.text; break;
               default: text.text = qsTr("?") + text.text; break;
            }  // end switch userAccidental
         }  // end if courtesy- and microtonal accidentals
         */
      }  // end for note
   }

   
   function renderGraceNoteNames (cursor, list, text, small) {
      if (list.length > 0) {     // Check for existence.
         // Now render grace note's names...
         for (var chordNum = 0; chordNum < list.length; chordNum++) {
            // iterate through all grace chords
            var chord = list[chordNum];
            // Set note text, grace notes are shown a bit smaller
            nameChord(chord.notes, text, small)
            if (text.text) {
               cursor.add(text)
	         }
            // X position the note name over the grace chord
            text.offsetX = chord.posX
            switch (cursor.voice) {
               case 1: case 3: text.placement = Placement.BELOW; break;
            }

            // If we consume a STAFF_TEXT we must manufacture a new one.
            if (text.text)
               text = newElement(Element.STAFF_TEXT);    // Make another STAFF_TEXT
         }
      }
      return text
   }
   
   // ainda não usado
   // Função auxiliar para obter o nome da nota (C, C#, D, etc.) a partir do seu pitch MIDI
   function getNoteName(pitch) {
        if (typeof pitch === "undefined") {
            return "?"; // Retorna '?' se o pitch não estiver definido
        }
        // Nomes das notas para 12 semitons (usando notação universal)
        var names = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
        // Usa o operador de módulo (%) para obter a classe de pitch (0-11)
        return names[pitch % 12];
   }

   // ainda não usado
   // NOVA FUNÇÃO: Adiciona os nomes das notas (como elementos Fingering)
   // diretamente nas cabeças das notas dentro de um acorde específico.
   // Recebe o acorde (chord) e o objeto da partitura (score) como parâmetros.
   function addNoteNamesToNoteHeads(currentChord, currentScore) {
       // Itera sobre cada nota individual dentro do acorde fornecido
       for (var noteIdx = 0; noteIdx < currentChord.notes.length; ++noteIdx) {
           var note = currentChord.notes[noteIdx]; // Obtém a nota atual
           if (!note.visible) continue; // Pula notas invisíveis (ex: pausas internas de acordes)

           // Obtém o nome da nota (ex: "C", "D", "E") usando a função auxiliar
           var noteName = getNoteName(note.pitch);

           // 1. Cria um novo elemento 'Fingering'
           var fingering = currentScore.createElement("Fingering");

           // 2. Define o texto do Fingering com o nome da nota
           fingering.text = noteName;

           // 3. Define o acorde como o "pai" do Fingering.
           // Isso é crucial para que o Fingering seja posicionado corretamente
           // em relação ao acorde/nota.
           fingering.parent = currentChord;

           // --- Linhas cruciais para posicionamento na cabeça da nota ---

           // 4. Define o PONTO DE ANCORAGEM do texto para a posição (X, Y) da nota.
           // note.pos.x e note.pos.y representam o centro aproximado da cabeça da nota
           // em relação ao seu acorde pai.
           fingering.pos.x = note.pos.x;
           fingering.pos.y = note.pos.y;

           // 5. Define o ALINHAMENTO do texto em relação ao seu ponto de ancoragem.
           // MuseScore.Anchor.Center: Alinha o CENTRO HORIZONTAL do texto com fingering.pos.x.
           // MuseScore.Anchor.Middle: Alinha o MEIO VERTICAL do texto com fingering.pos.y.
           fingering.xAlign = MuseScore.Anchor.Center;
           fingering.yAlign = MuseScore.Anchor.Middle;

           // 6. Define os DESLOCAMENTOS ADICIONAIS.
           // Como xAlign e yAlign já estão fazendo o trabalho de centralização,
           // definimos os offsets como 0.0. Pequenos ajustes podem ser feitos aqui
           // se o texto não parecer *perfeitamente* centralizado (ex: 0.1 ou -0.1).
           fingering.xOffset = 0.0;
           fingering.yOffset = 0.0;

           // --- Outras configurações de estilo (tamanho, cor) ---
           fingering.fontSize = 0.5; // Tamanho pequeno (ajuste conforme necessário, ex: 0.3 a 0.7)
           fingering.textColor = "#FFFFFF"; // Cor branca (código hexadecimal)
           fingering.textStyle = MuseScore.Style.Fingering; // Usa o estilo de dedilhado padrão do MuseScore

           // 7. Adiciona o elemento Fingering ao acorde
           currentChord.add(fingering);
       }
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

      for (var staff = startStaff; staff <= endStaff; staff++) {
         for (var voice = 0; voice < 4; voice++) {
            cursor.rewind(1); // beginning of selection
            cursor.voice    = voice;
            cursor.staffIdx = staff;

            if (fullScore)  // no selection
               cursor.rewind(0); // beginning of score

            while (cursor.segment && (fullScore || cursor.tick < endTick)) {
               if (cursor.element && cursor.element.type === Element.CHORD) {
                  var text = newElement(Element.FINGERING);      // Make a STAFF_TEXT
                  
                  // First...we need to scan grace notes for existence and break them
                  // into their appropriate lists with the correct ordering of notes.
                  var leadingLifo = Array();   // List for leading grace notes
                  var trailingFifo = Array();  // List for trailing grace notes
                  var graceChords = cursor.element.graceNotes;
                  // Build separate lists of leading and trailing grace note chords.
                  if (graceChords.length > 0) {
                     for (var chordNum = 0; chordNum < graceChords.length; chordNum++) {
                        var noteType = graceChords[chordNum].notes[0].noteType
                        if (noteType === NoteType.GRACE8_AFTER || noteType === NoteType.GRACE16_AFTER ||
                              noteType === NoteType.GRACE32_AFTER) {
                           trailingFifo.unshift(graceChords[chordNum])
                        } else {
                           leadingLifo.push(graceChords[chordNum])
                        }
                     }
                  }
                  

                  // Next process the leading grace notes, should they exist...
                  text = renderGraceNoteNames(cursor, leadingLifo, text, true)

                  // Now handle the note names on the main chord...
                  var notes = cursor.element.notes;
                  nameChord(notes, text, true);
                  if (text.text) {
                     cursor.add(text);
                     // addNoteNamesToNoteHeads
                     text.placement = Placement.BELOW;
                     text.color = "#FFFFFF";
                     text.fontSize = 3.5;
                     text.offsetX = 0.0;
                     text.offsetY = -0.05;
                  }

                  switch (cursor.voice) {
                     case 1: case 3: text.placement = Placement.BELOW; break;
                  }

                  if (text.text)
                     text = newElement(Element.STAFF_TEXT) // Make another STAFF_TEXT object

                  // Finally process trailing grace notes if they exist...
                  text = renderGraceNoteNames(cursor, trailingFifo, text, true)
               } // end if CHORD
               cursor.next();
            } // end while segment
         } // end for voice
      } // end for staff

      curScore.endCmd()
      quit();
   } // end onRun
}
