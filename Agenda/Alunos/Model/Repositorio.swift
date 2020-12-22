//
//  Repositorio.swift
//  Agenda
//
//  Created by Artur Rodrigues Fortunato on 22/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func recuperaAlunos(completion:@escaping(_ listaDeAlunos: Array<Aluno>)-> Void){
        var alunos = AlunoDao().recuperaAlunos()
        if alunos.count == 0 {
            AlunoAPI().recuperaAlunos(){
                alunos = AlunoDao().recuperaAlunos()
                completion(alunos)
            }
        }else{
            completion(alunos)
        }
    }
    
    func salvaAluno(aluno: Dictionary<String, String>) {
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDao().salvaAluno(dicionarioDeAluno: aluno)
    }
}
