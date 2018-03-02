open Prims
let (tacdbg : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false 
let mk_tactic_interpretation_0 :
  'r .
    'r FStar_Tactics_Basic.tac ->
      'r FStar_Syntax_Embeddings.embedder ->
        FStar_Syntax_Syntax.typ ->
          FStar_Ident.lid ->
            FStar_TypeChecker_Normalize.psc ->
              FStar_Syntax_Syntax.args ->
                FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    fun embed_r  ->
      fun t_r  ->
        fun nm  ->
          fun psc  ->
            fun args  ->
              match args with
              | (embedded_state,uu____63)::[] ->
                  let uu____80 =
                    FStar_Tactics_Embedding.unembed_proofstate embedded_state
                     in
                  FStar_Util.bind_opt uu____80
                    (fun ps  ->
                       let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                       FStar_Tactics_Basic.log ps1
                         (fun uu____94  ->
                            let uu____95 = FStar_Ident.string_of_lid nm  in
                            let uu____96 =
                              FStar_Syntax_Print.args_to_string args  in
                            FStar_Util.print2 "Reached %s, args are: %s\n"
                              uu____95 uu____96);
                       (let res = FStar_Tactics_Basic.run t ps1  in
                        let uu____100 =
                          let uu____101 =
                            FStar_TypeChecker_Normalize.psc_range psc  in
                          let uu____102 =
                            FStar_Tactics_Embedding.embed_result embed_r t_r
                             in
                          uu____102 uu____101 res  in
                        FStar_Pervasives_Native.Some uu____100))
              | uu____116 ->
                  failwith "Unexpected application of tactic primitive"
  
let mk_tactic_interpretation_1 :
  'a 'r .
    ('a -> 'r FStar_Tactics_Basic.tac) ->
      'a FStar_Syntax_Embeddings.unembedder ->
        'r FStar_Syntax_Embeddings.embedder ->
          FStar_Syntax_Syntax.typ ->
            FStar_Ident.lid ->
              FStar_TypeChecker_Normalize.psc ->
                FStar_Syntax_Syntax.args ->
                  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    fun unembed_a  ->
      fun embed_r  ->
        fun t_r  ->
          fun nm  ->
            fun psc  ->
              fun args  ->
                match args with
                | (a,uu____188)::(embedded_state,uu____190)::[] ->
                    let uu____217 =
                      FStar_Tactics_Embedding.unembed_proofstate
                        embedded_state
                       in
                    FStar_Util.bind_opt uu____217
                      (fun ps  ->
                         let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                         FStar_Tactics_Basic.log ps1
                           (fun uu____230  ->
                              let uu____231 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____232 =
                                FStar_Syntax_Print.term_to_string
                                  embedded_state
                                 in
                              FStar_Util.print2 "Reached %s, goals are: %s\n"
                                uu____231 uu____232);
                         (let uu____233 = unembed_a a  in
                          FStar_Util.bind_opt uu____233
                            (fun a1  ->
                               let res =
                                 let uu____245 = t a1  in
                                 FStar_Tactics_Basic.run uu____245 ps1  in
                               let uu____248 =
                                 let uu____249 =
                                   FStar_TypeChecker_Normalize.psc_range psc
                                    in
                                 let uu____250 =
                                   FStar_Tactics_Embedding.embed_result
                                     embed_r t_r
                                    in
                                 uu____250 uu____249 res  in
                               FStar_Pervasives_Native.Some uu____248)))
                | uu____264 ->
                    let uu____265 =
                      let uu____266 = FStar_Ident.string_of_lid nm  in
                      let uu____267 = FStar_Syntax_Print.args_to_string args
                         in
                      FStar_Util.format2
                        "Unexpected application of tactic primitive %s %s"
                        uu____266 uu____267
                       in
                    failwith uu____265
  
let mk_tactic_interpretation_1_env :
  'a 'r .
    (FStar_TypeChecker_Normalize.psc -> 'a -> 'r FStar_Tactics_Basic.tac) ->
      'a FStar_Syntax_Embeddings.unembedder ->
        'r FStar_Syntax_Embeddings.embedder ->
          FStar_Syntax_Syntax.typ ->
            FStar_Ident.lid ->
              FStar_TypeChecker_Normalize.psc ->
                FStar_Syntax_Syntax.args ->
                  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    fun unembed_a  ->
      fun embed_r  ->
        fun t_r  ->
          fun nm  ->
            fun psc  ->
              fun args  ->
                match args with
                | (a,uu____344)::(embedded_state,uu____346)::[] ->
                    let uu____373 =
                      FStar_Tactics_Embedding.unembed_proofstate
                        embedded_state
                       in
                    FStar_Util.bind_opt uu____373
                      (fun ps  ->
                         let ps1 = FStar_Tactics_Types.set_ps_psc psc ps  in
                         FStar_Tactics_Basic.log ps1
                           (fun uu____386  ->
                              let uu____387 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____388 =
                                FStar_Syntax_Print.term_to_string
                                  embedded_state
                                 in
                              FStar_Util.print2 "Reached %s, goals are: %s\n"
                                uu____387 uu____388);
                         (let uu____389 = unembed_a a  in
                          FStar_Util.bind_opt uu____389
                            (fun a1  ->
                               let res =
                                 let uu____401 = t psc a1  in
                                 FStar_Tactics_Basic.run uu____401 ps1  in
                               let uu____404 =
                                 let uu____405 =
                                   FStar_TypeChecker_Normalize.psc_range psc
                                    in
                                 let uu____406 =
                                   FStar_Tactics_Embedding.embed_result
                                     embed_r t_r
                                    in
                                 uu____406 uu____405 res  in
                               FStar_Pervasives_Native.Some uu____404)))
                | uu____420 ->
                    let uu____421 =
                      let uu____422 = FStar_Ident.string_of_lid nm  in
                      let uu____423 = FStar_Syntax_Print.args_to_string args
                         in
                      FStar_Util.format2
                        "Unexpected application of tactic primitive %s %s"
                        uu____422 uu____423
                       in
                    failwith uu____421
  
let mk_tactic_interpretation_2 :
  'a 'b 'r .
    ('a -> 'b -> 'r FStar_Tactics_Basic.tac) ->
      'a FStar_Syntax_Embeddings.unembedder ->
        'b FStar_Syntax_Embeddings.unembedder ->
          'r FStar_Syntax_Embeddings.embedder ->
            FStar_Syntax_Syntax.typ ->
              FStar_Ident.lid ->
                FStar_TypeChecker_Normalize.psc ->
                  FStar_Syntax_Syntax.args ->
                    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    fun unembed_a  ->
      fun unembed_b  ->
        fun embed_r  ->
          fun t_r  ->
            fun nm  ->
              fun psc  ->
                fun args  ->
                  match args with
                  | (a,uu____515)::(b,uu____517)::(embedded_state,uu____519)::[]
                      ->
                      let uu____556 =
                        FStar_Tactics_Embedding.unembed_proofstate
                          embedded_state
                         in
                      FStar_Util.bind_opt uu____556
                        (fun ps  ->
                           let ps1 = FStar_Tactics_Types.set_ps_psc psc ps
                              in
                           FStar_Tactics_Basic.log ps1
                             (fun uu____569  ->
                                let uu____570 = FStar_Ident.string_of_lid nm
                                   in
                                let uu____571 =
                                  FStar_Syntax_Print.term_to_string
                                    embedded_state
                                   in
                                FStar_Util.print2
                                  "Reached %s, goals are: %s\n" uu____570
                                  uu____571);
                           (let uu____572 = unembed_a a  in
                            FStar_Util.bind_opt uu____572
                              (fun a1  ->
                                 let uu____580 = unembed_b b  in
                                 FStar_Util.bind_opt uu____580
                                   (fun b1  ->
                                      let res =
                                        let uu____592 = t a1 b1  in
                                        FStar_Tactics_Basic.run uu____592 ps1
                                         in
                                      let uu____595 =
                                        let uu____596 =
                                          FStar_TypeChecker_Normalize.psc_range
                                            psc
                                           in
                                        let uu____597 =
                                          FStar_Tactics_Embedding.embed_result
                                            embed_r t_r
                                           in
                                        uu____597 uu____596 res  in
                                      FStar_Pervasives_Native.Some uu____595))))
                  | uu____611 ->
                      let uu____612 =
                        let uu____613 = FStar_Ident.string_of_lid nm  in
                        let uu____614 =
                          FStar_Syntax_Print.args_to_string args  in
                        FStar_Util.format2
                          "Unexpected application of tactic primitive %s %s"
                          uu____613 uu____614
                         in
                      failwith uu____612
  
let mk_tactic_interpretation_3 :
  'a 'b 'c 'r .
    ('a -> 'b -> 'c -> 'r FStar_Tactics_Basic.tac) ->
      'a FStar_Syntax_Embeddings.unembedder ->
        'b FStar_Syntax_Embeddings.unembedder ->
          'c FStar_Syntax_Embeddings.unembedder ->
            'r FStar_Syntax_Embeddings.embedder ->
              FStar_Syntax_Syntax.typ ->
                FStar_Ident.lid ->
                  FStar_TypeChecker_Normalize.psc ->
                    FStar_Syntax_Syntax.args ->
                      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun t  ->
    fun unembed_a  ->
      fun unembed_b  ->
        fun unembed_c  ->
          fun embed_r  ->
            fun t_r  ->
              fun nm  ->
                fun psc  ->
                  fun args  ->
                    match args with
                    | (a,uu____726)::(b,uu____728)::(c,uu____730)::(embedded_state,uu____732)::[]
                        ->
                        let uu____779 =
                          FStar_Tactics_Embedding.unembed_proofstate
                            embedded_state
                           in
                        FStar_Util.bind_opt uu____779
                          (fun ps  ->
                             let ps1 = FStar_Tactics_Types.set_ps_psc psc ps
                                in
                             FStar_Tactics_Basic.log ps1
                               (fun uu____792  ->
                                  let uu____793 =
                                    FStar_Ident.string_of_lid nm  in
                                  let uu____794 =
                                    FStar_Syntax_Print.term_to_string
                                      embedded_state
                                     in
                                  FStar_Util.print2
                                    "Reached %s, goals are: %s\n" uu____793
                                    uu____794);
                             (let uu____795 = unembed_a a  in
                              FStar_Util.bind_opt uu____795
                                (fun a1  ->
                                   let uu____803 = unembed_b b  in
                                   FStar_Util.bind_opt uu____803
                                     (fun b1  ->
                                        let uu____811 = unembed_c c  in
                                        FStar_Util.bind_opt uu____811
                                          (fun c1  ->
                                             let res =
                                               let uu____823 = t a1 b1 c1  in
                                               FStar_Tactics_Basic.run
                                                 uu____823 ps1
                                                in
                                             let uu____826 =
                                               let uu____827 =
                                                 FStar_TypeChecker_Normalize.psc_range
                                                   psc
                                                  in
                                               let uu____828 =
                                                 FStar_Tactics_Embedding.embed_result
                                                   embed_r t_r
                                                  in
                                               uu____828 uu____827 res  in
                                             FStar_Pervasives_Native.Some
                                               uu____826)))))
                    | uu____842 ->
                        let uu____843 =
                          let uu____844 = FStar_Ident.string_of_lid nm  in
                          let uu____845 =
                            FStar_Syntax_Print.args_to_string args  in
                          FStar_Util.format2
                            "Unexpected application of tactic primitive %s %s"
                            uu____844 uu____845
                           in
                        failwith uu____843
  
let mk_tactic_interpretation_5 :
  'a 'b 'c 'd 'e 'r .
    ('a -> 'b -> 'c -> 'd -> 'e -> 'r FStar_Tactics_Basic.tac) ->
      'a FStar_Syntax_Embeddings.unembedder ->
        'b FStar_Syntax_Embeddings.unembedder ->
          'c FStar_Syntax_Embeddings.unembedder ->
            'd FStar_Syntax_Embeddings.unembedder ->
              'e FStar_Syntax_Embeddings.unembedder ->
                'r FStar_Syntax_Embeddings.embedder ->
                  FStar_Syntax_Syntax.typ ->
                    FStar_Ident.lid ->
                      FStar_TypeChecker_Normalize.psc ->
                        FStar_Syntax_Syntax.args ->
                          FStar_Syntax_Syntax.term
                            FStar_Pervasives_Native.option
  =
  fun t  ->
    fun unembed_a  ->
      fun unembed_b  ->
        fun unembed_c  ->
          fun unembed_d  ->
            fun unembed_e  ->
              fun embed_r  ->
                fun t_r  ->
                  fun nm  ->
                    fun psc  ->
                      fun args  ->
                        match args with
                        | (a,uu____997)::(b,uu____999)::(c,uu____1001)::
                            (d,uu____1003)::(e,uu____1005)::(embedded_state,uu____1007)::[]
                            ->
                            let uu____1074 =
                              FStar_Tactics_Embedding.unembed_proofstate
                                embedded_state
                               in
                            FStar_Util.bind_opt uu____1074
                              (fun ps  ->
                                 let ps1 =
                                   FStar_Tactics_Types.set_ps_psc psc ps  in
                                 FStar_Tactics_Basic.log ps1
                                   (fun uu____1087  ->
                                      let uu____1088 =
                                        FStar_Ident.string_of_lid nm  in
                                      let uu____1089 =
                                        FStar_Syntax_Print.term_to_string
                                          embedded_state
                                         in
                                      FStar_Util.print2
                                        "Reached %s, goals are: %s\n"
                                        uu____1088 uu____1089);
                                 (let uu____1090 = unembed_a a  in
                                  FStar_Util.bind_opt uu____1090
                                    (fun a1  ->
                                       let uu____1098 = unembed_b b  in
                                       FStar_Util.bind_opt uu____1098
                                         (fun b1  ->
                                            let uu____1106 = unembed_c c  in
                                            FStar_Util.bind_opt uu____1106
                                              (fun c1  ->
                                                 let uu____1114 = unembed_d d
                                                    in
                                                 FStar_Util.bind_opt
                                                   uu____1114
                                                   (fun d1  ->
                                                      let uu____1122 =
                                                        unembed_e e  in
                                                      FStar_Util.bind_opt
                                                        uu____1122
                                                        (fun e1  ->
                                                           let res =
                                                             let uu____1134 =
                                                               t a1 b1 c1 d1
                                                                 e1
                                                                in
                                                             FStar_Tactics_Basic.run
                                                               uu____1134 ps1
                                                              in
                                                           let uu____1137 =
                                                             let uu____1138 =
                                                               FStar_TypeChecker_Normalize.psc_range
                                                                 psc
                                                                in
                                                             let uu____1139 =
                                                               FStar_Tactics_Embedding.embed_result
                                                                 embed_r t_r
                                                                in
                                                             uu____1139
                                                               uu____1138 res
                                                              in
                                                           FStar_Pervasives_Native.Some
                                                             uu____1137)))))))
                        | uu____1153 ->
                            let uu____1154 =
                              let uu____1155 = FStar_Ident.string_of_lid nm
                                 in
                              let uu____1156 =
                                FStar_Syntax_Print.args_to_string args  in
                              FStar_Util.format2
                                "Unexpected application of tactic primitive %s %s"
                                uu____1155 uu____1156
                               in
                            failwith uu____1154
  
let (step_from_native_step :
  FStar_Tactics_Native.native_primitive_step ->
    FStar_TypeChecker_Normalize.primitive_step)
  =
  fun s  ->
    {
      FStar_TypeChecker_Normalize.name = (s.FStar_Tactics_Native.name);
      FStar_TypeChecker_Normalize.arity = (s.FStar_Tactics_Native.arity);
      FStar_TypeChecker_Normalize.strong_reduction_ok =
        (s.FStar_Tactics_Native.strong_reduction_ok);
      FStar_TypeChecker_Normalize.requires_binder_substitution = false;
      FStar_TypeChecker_Normalize.interpretation =
        (fun psc  -> fun args  -> s.FStar_Tactics_Native.tactic psc args)
    }
  
let rec (primitive_steps :
  Prims.unit -> FStar_TypeChecker_Normalize.primitive_step Prims.list) =
  fun uu____1208  ->
    let mk1 nm arity interpretation =
      let nm1 = FStar_Tactics_Embedding.fstar_tactics_lid' ["Builtins"; nm]
         in
      {
        FStar_TypeChecker_Normalize.name = nm1;
        FStar_TypeChecker_Normalize.arity = arity;
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = true;
        FStar_TypeChecker_Normalize.interpretation =
          (fun psc  -> fun args  -> interpretation nm1 psc args)
      }  in
    let native_tactics = FStar_Tactics_Native.list_all ()  in
    let native_tactics_steps =
      FStar_List.map step_from_native_step native_tactics  in
    let mktac0 r name f e_r tr =
      mk1 name (Prims.parse_int "1") (mk_tactic_interpretation_0 f e_r tr)
       in
    let mktac1 a r name f u_a e_r tr =
      mk1 name (Prims.parse_int "2")
        (mk_tactic_interpretation_1 f u_a e_r tr)
       in
    let mktac2 a b r name f u_a u_b e_r tr =
      mk1 name (Prims.parse_int "3")
        (mk_tactic_interpretation_2 f u_a u_b e_r tr)
       in
    let mktac3 a b c r name f u_a u_b u_c e_r tr =
      mk1 name (Prims.parse_int "4")
        (mk_tactic_interpretation_3 f u_a u_b u_c e_r tr)
       in
    let mktac5 a b c d e r name f u_a u_b u_c u_d u_e e_r tr =
      mk1 name (Prims.parse_int "6")
        (mk_tactic_interpretation_5 f u_a u_b u_c u_d u_e e_r tr)
       in
    let decr_depth_interp psc args =
      match args with
      | (ps,uu____1696)::[] ->
          let uu____1713 = FStar_Tactics_Embedding.unembed_proofstate ps  in
          FStar_Util.bind_opt uu____1713
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               let uu____1721 =
                 let uu____1722 = FStar_TypeChecker_Normalize.psc_range psc
                    in
                 let uu____1723 = FStar_Tactics_Types.decr_depth ps2  in
                 FStar_Tactics_Embedding.embed_proofstate uu____1722
                   uu____1723
                  in
               FStar_Pervasives_Native.Some uu____1721)
      | uu____1724 -> failwith "Unexpected application of decr_depth"  in
    let decr_depth_step =
      let uu____1728 =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.decr_depth"  in
      {
        FStar_TypeChecker_Normalize.name = uu____1728;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation = decr_depth_interp
      }  in
    let incr_depth_interp psc args =
      match args with
      | (ps,uu____1741)::[] ->
          let uu____1758 = FStar_Tactics_Embedding.unembed_proofstate ps  in
          FStar_Util.bind_opt uu____1758
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               let uu____1766 =
                 let uu____1767 = FStar_TypeChecker_Normalize.psc_range psc
                    in
                 let uu____1768 = FStar_Tactics_Types.incr_depth ps2  in
                 FStar_Tactics_Embedding.embed_proofstate uu____1767
                   uu____1768
                  in
               FStar_Pervasives_Native.Some uu____1766)
      | uu____1769 -> failwith "Unexpected application of incr_depth"  in
    let incr_depth_step =
      let uu____1773 =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.incr_depth"  in
      {
        FStar_TypeChecker_Normalize.name = uu____1773;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation = incr_depth_interp
      }  in
    let tracepoint_interp psc args =
      match args with
      | (ps,uu____1790)::[] ->
          let uu____1807 = FStar_Tactics_Embedding.unembed_proofstate ps  in
          FStar_Util.bind_opt uu____1807
            (fun ps1  ->
               let ps2 = FStar_Tactics_Types.set_ps_psc psc ps1  in
               FStar_Tactics_Types.tracepoint ps2;
               FStar_Pervasives_Native.Some FStar_Syntax_Util.exp_unit)
      | uu____1820 -> failwith "Unexpected application of tracepoint"  in
    let set_proofstate_range_interp psc args =
      match args with
      | (ps,uu____1837)::(r,uu____1839)::[] ->
          let uu____1866 = FStar_Tactics_Embedding.unembed_proofstate ps  in
          FStar_Util.bind_opt uu____1866
            (fun ps1  ->
               let uu____1872 = FStar_Syntax_Embeddings.unembed_range r  in
               FStar_Util.bind_opt uu____1872
                 (fun r1  ->
                    let ps' = FStar_Tactics_Types.set_proofstate_range ps1 r1
                       in
                    let uu____1880 =
                      let uu____1881 =
                        FStar_TypeChecker_Normalize.psc_range psc  in
                      FStar_Tactics_Embedding.embed_proofstate uu____1881 ps'
                       in
                    FStar_Pervasives_Native.Some uu____1880))
      | uu____1882 ->
          failwith "Unexpected application of set_proofstate_range"
       in
    let set_proofstate_range_step =
      let nm =
        FStar_Ident.lid_of_str "FStar.Tactics.Types.set_proofstate_range"  in
      {
        FStar_TypeChecker_Normalize.name = nm;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "2");
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = false;
        FStar_TypeChecker_Normalize.interpretation =
          set_proofstate_range_interp
      }  in
    let tracepoint_step =
      let nm = FStar_Ident.lid_of_str "FStar.Tactics.Types.tracepoint"  in
      {
        FStar_TypeChecker_Normalize.name = nm;
        FStar_TypeChecker_Normalize.arity = (Prims.parse_int "1");
        FStar_TypeChecker_Normalize.strong_reduction_ok = false;
        FStar_TypeChecker_Normalize.requires_binder_substitution = true;
        FStar_TypeChecker_Normalize.interpretation = tracepoint_interp
      }  in
    let put1 rng t =
      let uu___58_1896 = t  in
      {
        FStar_Syntax_Syntax.n = (uu___58_1896.FStar_Syntax_Syntax.n);
        FStar_Syntax_Syntax.pos = rng;
        FStar_Syntax_Syntax.vars = (uu___58_1896.FStar_Syntax_Syntax.vars)
      }  in
    let get1 t = FStar_Pervasives_Native.Some t  in
    let uu____1903 =
      let uu____1906 =
        mktac2 () () () "__fail"
          (fun a434  ->
             fun a435  ->
               (Obj.magic (fun uu____1908  -> FStar_Tactics_Basic.fail)) a434
                 a435) (Obj.magic get1)
          (Obj.magic FStar_Syntax_Embeddings.unembed_string) (Obj.magic put1)
          FStar_Syntax_Syntax.t_unit
         in
      let uu____1909 =
        let uu____1912 =
          mktac0 () "__trivial" (Obj.magic FStar_Tactics_Basic.trivial)
            (Obj.magic FStar_Syntax_Embeddings.embed_unit)
            FStar_Syntax_Syntax.t_unit
           in
        let uu____1913 =
          let uu____1916 =
            let uu____1917 =
              FStar_Syntax_Embeddings.embed_option put1
                FStar_Syntax_Syntax.t_unit
               in
            mktac2 () () () "__trytac"
              (fun a436  ->
                 fun a437  ->
                   (Obj.magic (fun uu____1923  -> FStar_Tactics_Basic.trytac))
                     a436 a437) (Obj.magic get1)
              (Obj.magic (unembed_tactic_0' get1)) (Obj.magic uu____1917)
              FStar_Syntax_Syntax.t_unit
             in
          let uu____1930 =
            let uu____1933 =
              mktac0 () "__intro" (Obj.magic FStar_Tactics_Basic.intro)
                (Obj.magic FStar_Reflection_Basic.embed_binder)
                FStar_Reflection_Data.fstar_refl_binder
               in
            let uu____1934 =
              let uu____1937 =
                let uu____1938 =
                  FStar_Syntax_Embeddings.embed_pair
                    FStar_Reflection_Basic.embed_binder
                    FStar_Reflection_Data.fstar_refl_binder
                    FStar_Reflection_Basic.embed_binder
                    FStar_Reflection_Data.fstar_refl_binder
                   in
                let uu____1945 =
                  FStar_Tactics_Embedding.pair_typ
                    FStar_Reflection_Data.fstar_refl_binder
                    FStar_Reflection_Data.fstar_refl_binder
                   in
                mktac0 () "__intro_rec"
                  (Obj.magic FStar_Tactics_Basic.intro_rec)
                  (Obj.magic uu____1938) uu____1945
                 in
              let uu____1952 =
                let uu____1955 =
                  let uu____1956 =
                    FStar_Syntax_Embeddings.unembed_list
                      FStar_Syntax_Embeddings.unembed_norm_step
                     in
                  mktac1 () () "__norm"
                    (fun a438  -> (Obj.magic FStar_Tactics_Basic.norm) a438)
                    (Obj.magic uu____1956)
                    (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                    FStar_Syntax_Syntax.t_unit
                   in
                let uu____1965 =
                  let uu____1968 =
                    let uu____1969 =
                      FStar_Syntax_Embeddings.unembed_list
                        FStar_Syntax_Embeddings.unembed_norm_step
                       in
                    mktac3 () () () () "__norm_term_env"
                      (fun a439  ->
                         fun a440  ->
                           fun a441  ->
                             (Obj.magic FStar_Tactics_Basic.norm_term_env)
                               a439 a440 a441)
                      (Obj.magic FStar_Reflection_Basic.unembed_env)
                      (Obj.magic uu____1969)
                      (Obj.magic FStar_Reflection_Basic.unembed_term)
                      (Obj.magic FStar_Reflection_Basic.embed_term)
                      FStar_Syntax_Syntax.t_term
                     in
                  let uu____1978 =
                    let uu____1981 =
                      let uu____1982 =
                        FStar_Syntax_Embeddings.unembed_list
                          FStar_Syntax_Embeddings.unembed_norm_step
                         in
                      mktac2 () () () "__norm_binder_type"
                        (fun a442  ->
                           fun a443  ->
                             (Obj.magic FStar_Tactics_Basic.norm_binder_type)
                               a442 a443) (Obj.magic uu____1982)
                        (Obj.magic FStar_Reflection_Basic.unembed_binder)
                        (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                        FStar_Syntax_Syntax.t_unit
                       in
                    let uu____1991 =
                      let uu____1994 =
                        mktac2 () () () "__rename_to"
                          (fun a444  ->
                             fun a445  ->
                               (Obj.magic FStar_Tactics_Basic.rename_to) a444
                                 a445)
                          (Obj.magic FStar_Reflection_Basic.unembed_binder)
                          (Obj.magic FStar_Syntax_Embeddings.unembed_string)
                          (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                          FStar_Syntax_Syntax.t_unit
                         in
                      let uu____1995 =
                        let uu____1998 =
                          mktac1 () () "__binder_retype"
                            (fun a446  ->
                               (Obj.magic FStar_Tactics_Basic.binder_retype)
                                 a446)
                            (Obj.magic FStar_Reflection_Basic.unembed_binder)
                            (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                            FStar_Syntax_Syntax.t_unit
                           in
                        let uu____1999 =
                          let uu____2002 =
                            mktac0 () "__revert"
                              (Obj.magic FStar_Tactics_Basic.revert)
                              (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                              FStar_Syntax_Syntax.t_unit
                             in
                          let uu____2003 =
                            let uu____2006 =
                              mktac0 () "__clear_top"
                                (Obj.magic FStar_Tactics_Basic.clear_top)
                                (Obj.magic FStar_Syntax_Embeddings.embed_unit)
                                FStar_Syntax_Syntax.t_unit
                               in
                            let uu____2007 =
                              let uu____2010 =
                                mktac1 () () "__clear"
                                  (fun a447  ->
                                     (Obj.magic FStar_Tactics_Basic.clear)
                                       a447)
                                  (Obj.magic
                                     FStar_Reflection_Basic.unembed_binder)
                                  (Obj.magic
                                     FStar_Syntax_Embeddings.embed_unit)
                                  FStar_Syntax_Syntax.t_unit
                                 in
                              let uu____2011 =
                                let uu____2014 =
                                  mktac1 () () "__rewrite"
                                    (fun a448  ->
                                       (Obj.magic FStar_Tactics_Basic.rewrite)
                                         a448)
                                    (Obj.magic
                                       FStar_Reflection_Basic.unembed_binder)
                                    (Obj.magic
                                       FStar_Syntax_Embeddings.embed_unit)
                                    FStar_Syntax_Syntax.t_unit
                                   in
                                let uu____2015 =
                                  let uu____2018 =
                                    mktac0 () "__smt"
                                      (Obj.magic FStar_Tactics_Basic.smt)
                                      (Obj.magic
                                         FStar_Syntax_Embeddings.embed_unit)
                                      FStar_Syntax_Syntax.t_unit
                                     in
                                  let uu____2019 =
                                    let uu____2022 =
                                      mktac0 () "__refine_intro"
                                        (Obj.magic
                                           FStar_Tactics_Basic.refine_intro)
                                        (Obj.magic
                                           FStar_Syntax_Embeddings.embed_unit)
                                        FStar_Syntax_Syntax.t_unit
                                       in
                                    let uu____2023 =
                                      let uu____2026 =
                                        mktac3 () () () () "__t_exact"
                                          (fun a449  ->
                                             fun a450  ->
                                               fun a451  ->
                                                 (Obj.magic
                                                    FStar_Tactics_Basic.t_exact)
                                                   a449 a450 a451)
                                          (Obj.magic
                                             FStar_Syntax_Embeddings.unembed_bool)
                                          (Obj.magic
                                             FStar_Syntax_Embeddings.unembed_bool)
                                          (Obj.magic
                                             FStar_Reflection_Basic.unembed_term)
                                          (Obj.magic
                                             FStar_Syntax_Embeddings.embed_unit)
                                          FStar_Syntax_Syntax.t_unit
                                         in
                                      let uu____2027 =
                                        let uu____2030 =
                                          mktac1 () () "__apply"
                                            (fun a452  ->
                                               (Obj.magic
                                                  (FStar_Tactics_Basic.apply
                                                     true)) a452)
                                            (Obj.magic
                                               FStar_Reflection_Basic.unembed_term)
                                            (Obj.magic
                                               FStar_Syntax_Embeddings.embed_unit)
                                            FStar_Syntax_Syntax.t_unit
                                           in
                                        let uu____2031 =
                                          let uu____2034 =
                                            mktac1 () () "__apply_raw"
                                              (fun a453  ->
                                                 (Obj.magic
                                                    (FStar_Tactics_Basic.apply
                                                       false)) a453)
                                              (Obj.magic
                                                 FStar_Reflection_Basic.unembed_term)
                                              (Obj.magic
                                                 FStar_Syntax_Embeddings.embed_unit)
                                              FStar_Syntax_Syntax.t_unit
                                             in
                                          let uu____2035 =
                                            let uu____2038 =
                                              mktac1 () () "__apply_lemma"
                                                (fun a454  ->
                                                   (Obj.magic
                                                      FStar_Tactics_Basic.apply_lemma)
                                                     a454)
                                                (Obj.magic
                                                   FStar_Reflection_Basic.unembed_term)
                                                (Obj.magic
                                                   FStar_Syntax_Embeddings.embed_unit)
                                                FStar_Syntax_Syntax.t_unit
                                               in
                                            let uu____2039 =
                                              let uu____2042 =
                                                let uu____2043 =
                                                  FStar_Syntax_Embeddings.embed_pair
                                                    put1
                                                    FStar_Syntax_Syntax.t_unit
                                                    put1
                                                    FStar_Syntax_Syntax.t_unit
                                                   in
                                                mktac5 () () () () () ()
                                                  "__divide"
                                                  (fun a455  ->
                                                     fun a456  ->
                                                       fun a457  ->
                                                         fun a458  ->
                                                           fun a459  ->
                                                             (Obj.magic
                                                                (fun
                                                                   uu____2052
                                                                    ->
                                                                   fun
                                                                    uu____2053
                                                                     ->
                                                                    FStar_Tactics_Basic.divide))
                                                               a455 a456 a457
                                                               a458 a459)
                                                  (Obj.magic get1)
                                                  (Obj.magic get1)
                                                  (Obj.magic
                                                     FStar_Syntax_Embeddings.unembed_int)
                                                  (Obj.magic
                                                     (unembed_tactic_0' get1))
                                                  (Obj.magic
                                                     (unembed_tactic_0' get1))
                                                  (Obj.magic uu____2043)
                                                  FStar_Syntax_Syntax.t_unit
                                                 in
                                              let uu____2060 =
                                                let uu____2063 =
                                                  mktac1 () ()
                                                    "__set_options"
                                                    (fun a460  ->
                                                       (Obj.magic
                                                          FStar_Tactics_Basic.set_options)
                                                         a460)
                                                    (Obj.magic
                                                       FStar_Syntax_Embeddings.unembed_string)
                                                    (Obj.magic
                                                       FStar_Syntax_Embeddings.embed_unit)
                                                    FStar_Syntax_Syntax.t_unit
                                                   in
                                                let uu____2064 =
                                                  let uu____2067 =
                                                    mktac2 () () () "__seq"
                                                      (fun a461  ->
                                                         fun a462  ->
                                                           (Obj.magic
                                                              FStar_Tactics_Basic.seq)
                                                             a461 a462)
                                                      (Obj.magic
                                                         (unembed_tactic_0'
                                                            FStar_Syntax_Embeddings.unembed_unit))
                                                      (Obj.magic
                                                         (unembed_tactic_0'
                                                            FStar_Syntax_Embeddings.unembed_unit))
                                                      (Obj.magic
                                                         FStar_Syntax_Embeddings.embed_unit)
                                                      FStar_Syntax_Syntax.t_unit
                                                     in
                                                  let uu____2068 =
                                                    let uu____2071 =
                                                      mktac1 () () "__tc"
                                                        (fun a463  ->
                                                           (Obj.magic
                                                              FStar_Tactics_Basic.tc)
                                                             a463)
                                                        (Obj.magic
                                                           FStar_Reflection_Basic.unembed_term)
                                                        (Obj.magic
                                                           FStar_Reflection_Basic.embed_term)
                                                        FStar_Syntax_Syntax.t_term
                                                       in
                                                    let uu____2072 =
                                                      let uu____2075 =
                                                        mktac1 () ()
                                                          "__unshelve"
                                                          (fun a464  ->
                                                             (Obj.magic
                                                                FStar_Tactics_Basic.unshelve)
                                                               a464)
                                                          (Obj.magic
                                                             FStar_Reflection_Basic.unembed_term)
                                                          (Obj.magic
                                                             FStar_Syntax_Embeddings.embed_unit)
                                                          FStar_Syntax_Syntax.t_unit
                                                         in
                                                      let uu____2076 =
                                                        let uu____2079 =
                                                          mktac2 () () ()
                                                            "__unquote"
                                                            (fun a465  ->
                                                               fun a466  ->
                                                                 (Obj.magic
                                                                    FStar_Tactics_Basic.unquote)
                                                                   a465 a466)
                                                            (Obj.magic get1)
                                                            (Obj.magic
                                                               FStar_Reflection_Basic.unembed_term)
                                                            (Obj.magic put1)
                                                            FStar_Syntax_Syntax.t_unit
                                                           in
                                                        let uu____2080 =
                                                          let uu____2083 =
                                                            mktac1 () ()
                                                              "__prune"
                                                              (fun a467  ->
                                                                 (Obj.magic
                                                                    FStar_Tactics_Basic.prune)
                                                                   a467)
                                                              (Obj.magic
                                                                 FStar_Syntax_Embeddings.unembed_string)
                                                              (Obj.magic
                                                                 FStar_Syntax_Embeddings.embed_unit)
                                                              FStar_Syntax_Syntax.t_unit
                                                             in
                                                          let uu____2084 =
                                                            let uu____2087 =
                                                              mktac1 () ()
                                                                "__addns"
                                                                (fun a468  ->
                                                                   (Obj.magic
                                                                    FStar_Tactics_Basic.addns)
                                                                    a468)
                                                                (Obj.magic
                                                                   FStar_Syntax_Embeddings.unembed_string)
                                                                (Obj.magic
                                                                   FStar_Syntax_Embeddings.embed_unit)
                                                                FStar_Syntax_Syntax.t_unit
                                                               in
                                                            let uu____2088 =
                                                              let uu____2091
                                                                =
                                                                mktac1 () ()
                                                                  "__print"
                                                                  (fun a469 
                                                                    ->
                                                                    (Obj.magic
                                                                    (fun x 
                                                                    ->
                                                                    FStar_Tactics_Basic.tacprint
                                                                    x;
                                                                    FStar_Tactics_Basic.ret
                                                                    ())) a469)
                                                                  (Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                  (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                  FStar_Syntax_Syntax.t_unit
                                                                 in
                                                              let uu____2096
                                                                =
                                                                let uu____2099
                                                                  =
                                                                  mktac1 ()
                                                                    ()
                                                                    "__dump"
                                                                    (
                                                                    fun a470 
                                                                    ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.print_proof_state)
                                                                    a470)
                                                                    (
                                                                    Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                    (
                                                                    Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                   in
                                                                let uu____2100
                                                                  =
                                                                  let uu____2103
                                                                    =
                                                                    mktac1 ()
                                                                    ()
                                                                    "__dump1"
                                                                    (fun a471
                                                                     ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.print_proof_state1)
                                                                    a471)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                  let uu____2104
                                                                    =
                                                                    let uu____2107
                                                                    =
                                                                    mktac2 ()
                                                                    () ()
                                                                    "__pointwise"
                                                                    (fun a472
                                                                     ->
                                                                    fun a473 
                                                                    ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.pointwise)
                                                                    a472 a473)
                                                                    (Obj.magic
                                                                    FStar_Tactics_Embedding.unembed_direction)
                                                                    (Obj.magic
                                                                    (unembed_tactic_0'
                                                                    FStar_Syntax_Embeddings.unembed_unit))
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2108
                                                                    =
                                                                    let uu____2111
                                                                    =
                                                                    mktac0 ()
                                                                    "__trefl"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.trefl)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2112
                                                                    =
                                                                    let uu____2115
                                                                    =
                                                                    mktac0 ()
                                                                    "__later"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.later)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2116
                                                                    =
                                                                    let uu____2119
                                                                    =
                                                                    mktac0 ()
                                                                    "__dup"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.dup)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2120
                                                                    =
                                                                    let uu____2123
                                                                    =
                                                                    mktac0 ()
                                                                    "__flip"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.flip)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2124
                                                                    =
                                                                    let uu____2127
                                                                    =
                                                                    mktac0 ()
                                                                    "__qed"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.qed)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_unit)
                                                                    FStar_Syntax_Syntax.t_unit
                                                                     in
                                                                    let uu____2128
                                                                    =
                                                                    let uu____2131
                                                                    =
                                                                    let uu____2132
                                                                    =
                                                                    FStar_Syntax_Embeddings.embed_pair
                                                                    FStar_Reflection_Basic.embed_term
                                                                    FStar_Syntax_Syntax.t_term
                                                                    FStar_Reflection_Basic.embed_term
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    let uu____2139
                                                                    =
                                                                    FStar_Tactics_Embedding.pair_typ
                                                                    FStar_Syntax_Syntax.t_term
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    mktac1 ()
                                                                    ()
                                                                    "__cases"
                                                                    (fun a474
                                                                     ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.cases)
                                                                    a474)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.unembed_term)
                                                                    (Obj.magic
                                                                    uu____2132)
                                                                    uu____2139
                                                                     in
                                                                    let uu____2146
                                                                    =
                                                                    let uu____2149
                                                                    =
                                                                    mktac0 ()
                                                                    "__top_env"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.top_env)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_env)
                                                                    FStar_Reflection_Data.fstar_refl_env
                                                                     in
                                                                    let uu____2150
                                                                    =
                                                                    let uu____2153
                                                                    =
                                                                    mktac0 ()
                                                                    "__cur_env"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.cur_env)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_env)
                                                                    FStar_Reflection_Data.fstar_refl_env
                                                                     in
                                                                    let uu____2154
                                                                    =
                                                                    let uu____2157
                                                                    =
                                                                    mktac0 ()
                                                                    "__cur_goal"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.cur_goal')
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_term)
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    let uu____2158
                                                                    =
                                                                    let uu____2161
                                                                    =
                                                                    mktac0 ()
                                                                    "__cur_witness"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.cur_witness)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_term)
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    let uu____2162
                                                                    =
                                                                    let uu____2165
                                                                    =
                                                                    mktac0 ()
                                                                    "__is_guard"
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.is_guard)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_bool)
                                                                    FStar_Syntax_Syntax.t_bool
                                                                     in
                                                                    let uu____2166
                                                                    =
                                                                    let uu____2169
                                                                    =
                                                                    let uu____2170
                                                                    =
                                                                    FStar_Syntax_Embeddings.unembed_option
                                                                    FStar_Reflection_Basic.unembed_term
                                                                     in
                                                                    mktac2 ()
                                                                    () ()
                                                                    "__uvar_env"
                                                                    (fun a475
                                                                     ->
                                                                    fun a476 
                                                                    ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.uvar_env)
                                                                    a475 a476)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.unembed_env)
                                                                    (Obj.magic
                                                                    uu____2170)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_term)
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    let uu____2179
                                                                    =
                                                                    let uu____2182
                                                                    =
                                                                    mktac2 ()
                                                                    () ()
                                                                    "__unify"
                                                                    (fun a477
                                                                     ->
                                                                    fun a478 
                                                                    ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.unify)
                                                                    a477 a478)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.unembed_term)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.unembed_term)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_bool)
                                                                    FStar_Syntax_Syntax.t_bool
                                                                     in
                                                                    let uu____2183
                                                                    =
                                                                    let uu____2186
                                                                    =
                                                                    mktac3 ()
                                                                    () () ()
                                                                    "__launch_process"
                                                                    (fun a479
                                                                     ->
                                                                    fun a480 
                                                                    ->
                                                                    fun a481 
                                                                    ->
                                                                    (Obj.magic
                                                                    FStar_Tactics_Basic.launch_process)
                                                                    a479 a480
                                                                    a481)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.unembed_string)
                                                                    (Obj.magic
                                                                    FStar_Syntax_Embeddings.embed_string)
                                                                    FStar_Syntax_Syntax.t_string
                                                                     in
                                                                    let uu____2187
                                                                    =
                                                                    let uu____2190
                                                                    =
                                                                    mktac2 ()
                                                                    () ()
                                                                    "__embed"
                                                                    (fun a482
                                                                     ->
                                                                    fun a483 
                                                                    ->
                                                                    (Obj.magic
                                                                    (fun
                                                                    uu____2193
                                                                     ->
                                                                    fun x  ->
                                                                    FStar_Tactics_Basic.ret
                                                                    x)) a482
                                                                    a483)
                                                                    (Obj.magic
                                                                    get1)
                                                                    (Obj.magic
                                                                    get1)
                                                                    (Obj.magic
                                                                    FStar_Reflection_Basic.embed_term)
                                                                    FStar_Syntax_Syntax.t_term
                                                                     in
                                                                    [uu____2190;
                                                                    decr_depth_step;
                                                                    incr_depth_step;
                                                                    tracepoint_step;
                                                                    set_proofstate_range_step]
                                                                     in
                                                                    uu____2186
                                                                    ::
                                                                    uu____2187
                                                                     in
                                                                    uu____2182
                                                                    ::
                                                                    uu____2183
                                                                     in
                                                                    uu____2169
                                                                    ::
                                                                    uu____2179
                                                                     in
                                                                    uu____2165
                                                                    ::
                                                                    uu____2166
                                                                     in
                                                                    uu____2161
                                                                    ::
                                                                    uu____2162
                                                                     in
                                                                    uu____2157
                                                                    ::
                                                                    uu____2158
                                                                     in
                                                                    uu____2153
                                                                    ::
                                                                    uu____2154
                                                                     in
                                                                    uu____2149
                                                                    ::
                                                                    uu____2150
                                                                     in
                                                                    uu____2131
                                                                    ::
                                                                    uu____2146
                                                                     in
                                                                    uu____2127
                                                                    ::
                                                                    uu____2128
                                                                     in
                                                                    uu____2123
                                                                    ::
                                                                    uu____2124
                                                                     in
                                                                    uu____2119
                                                                    ::
                                                                    uu____2120
                                                                     in
                                                                    uu____2115
                                                                    ::
                                                                    uu____2116
                                                                     in
                                                                    uu____2111
                                                                    ::
                                                                    uu____2112
                                                                     in
                                                                    uu____2107
                                                                    ::
                                                                    uu____2108
                                                                     in
                                                                  uu____2103
                                                                    ::
                                                                    uu____2104
                                                                   in
                                                                uu____2099 ::
                                                                  uu____2100
                                                                 in
                                                              uu____2091 ::
                                                                uu____2096
                                                               in
                                                            uu____2087 ::
                                                              uu____2088
                                                             in
                                                          uu____2083 ::
                                                            uu____2084
                                                           in
                                                        uu____2079 ::
                                                          uu____2080
                                                         in
                                                      uu____2075 ::
                                                        uu____2076
                                                       in
                                                    uu____2071 :: uu____2072
                                                     in
                                                  uu____2067 :: uu____2068
                                                   in
                                                uu____2063 :: uu____2064  in
                                              uu____2042 :: uu____2060  in
                                            uu____2038 :: uu____2039  in
                                          uu____2034 :: uu____2035  in
                                        uu____2030 :: uu____2031  in
                                      uu____2026 :: uu____2027  in
                                    uu____2022 :: uu____2023  in
                                  uu____2018 :: uu____2019  in
                                uu____2014 :: uu____2015  in
                              uu____2010 :: uu____2011  in
                            uu____2006 :: uu____2007  in
                          uu____2002 :: uu____2003  in
                        uu____1998 :: uu____1999  in
                      uu____1994 :: uu____1995  in
                    uu____1981 :: uu____1991  in
                  uu____1968 :: uu____1978  in
                uu____1955 :: uu____1965  in
              uu____1937 :: uu____1952  in
            uu____1933 :: uu____1934  in
          uu____1916 :: uu____1930  in
        uu____1912 :: uu____1913  in
      uu____1906 :: uu____1909  in
    FStar_List.append uu____1903
      (FStar_List.append FStar_Reflection_Interpreter.reflection_primops
         native_tactics_steps)

and unembed_tactic_0 :
  'Ab .
    'Ab FStar_Syntax_Embeddings.unembedder ->
      FStar_Syntax_Syntax.term -> 'Ab FStar_Tactics_Basic.tac
  =
  fun unembed_b  ->
    fun embedded_tac_b  ->
      FStar_Tactics_Basic.bind FStar_Tactics_Basic.get
        (fun proof_state  ->
           let rng = embedded_tac_b.FStar_Syntax_Syntax.pos  in
           let tm =
             let uu____2217 =
               let uu____2218 =
                 let uu____2219 =
                   let uu____2220 =
                     FStar_Tactics_Embedding.embed_proofstate rng proof_state
                      in
                   FStar_Syntax_Syntax.as_arg uu____2220  in
                 [uu____2219]  in
               FStar_Syntax_Syntax.mk_Tm_app embedded_tac_b uu____2218  in
             uu____2217 FStar_Pervasives_Native.None rng  in
           let steps =
             [FStar_TypeChecker_Normalize.Weak;
             FStar_TypeChecker_Normalize.Reify;
             FStar_TypeChecker_Normalize.UnfoldUntil
               FStar_Syntax_Syntax.Delta_constant;
             FStar_TypeChecker_Normalize.UnfoldTac;
             FStar_TypeChecker_Normalize.Primops;
             FStar_TypeChecker_Normalize.Unascribe]  in
           (let uu____2227 =
              FStar_TypeChecker_Env.debug
                proof_state.FStar_Tactics_Types.main_context
                (FStar_Options.Other "TacVerbose")
               in
            if uu____2227
            then
              let uu____2228 = FStar_Syntax_Print.term_to_string tm  in
              FStar_Util.print1 "Starting normalizer with %s\n" uu____2228
            else ());
           (let result =
              let uu____2231 = primitive_steps ()  in
              FStar_TypeChecker_Normalize.normalize_with_primitive_steps
                uu____2231 steps proof_state.FStar_Tactics_Types.main_context
                tm
               in
            (let uu____2235 =
               FStar_TypeChecker_Env.debug
                 proof_state.FStar_Tactics_Types.main_context
                 (FStar_Options.Other "TacVerbose")
                in
             if uu____2235
             then
               let uu____2236 = FStar_Syntax_Print.term_to_string result  in
               FStar_Util.print1 "Reduced tactic: got %s\n" uu____2236
             else ());
            (let res =
               FStar_Tactics_Embedding.unembed_result result unembed_b  in
             match res with
             | FStar_Pervasives_Native.Some (FStar_Util.Inl (b,ps)) ->
                 let uu____2281 = FStar_Tactics_Basic.set ps  in
                 FStar_Tactics_Basic.bind uu____2281
                   (fun uu____2285  -> FStar_Tactics_Basic.ret b)
             | FStar_Pervasives_Native.Some (FStar_Util.Inr (msg,ps)) ->
                 let uu____2308 = FStar_Tactics_Basic.set ps  in
                 FStar_Tactics_Basic.bind uu____2308
                   (fun uu____2312  -> FStar_Tactics_Basic.fail msg)
             | FStar_Pervasives_Native.None  ->
                 let uu____2325 =
                   let uu____2330 =
                     let uu____2331 =
                       FStar_Syntax_Print.term_to_string result  in
                     FStar_Util.format1
                       "Tactic got stuck! Please file a bug report with a minimal reproduction of this issue.\n%s"
                       uu____2331
                      in
                   (FStar_Errors.Fatal_TacticGotStuck, uu____2330)  in
                 FStar_Errors.raise_error uu____2325
                   (proof_state.FStar_Tactics_Types.main_context).FStar_TypeChecker_Env.range)))

and unembed_tactic_0' :
  'Ab .
    'Ab FStar_Syntax_Embeddings.unembedder ->
      FStar_Syntax_Syntax.term ->
        'Ab FStar_Tactics_Basic.tac FStar_Pervasives_Native.option
  =
  fun unembed_b  ->
    fun embedded_tac_b  ->
      let uu____2340 = unembed_tactic_0 unembed_b embedded_tac_b  in
      FStar_All.pipe_left (fun _0_40  -> FStar_Pervasives_Native.Some _0_40)
        uu____2340

let (report_implicits :
  FStar_Tactics_Types.proofstate ->
    FStar_TypeChecker_Env.implicits -> Prims.unit)
  =
  fun ps  ->
    fun is  ->
      let errs =
        FStar_List.map
          (fun uu____2396  ->
             match uu____2396 with
             | (r,uu____2416,uv,uu____2418,ty,rng) ->
                 let uu____2421 =
                   let uu____2422 = FStar_Syntax_Print.uvar_to_string uv  in
                   let uu____2423 = FStar_Syntax_Print.term_to_string ty  in
                   FStar_Util.format3
                     "Tactic left uninstantiated unification variable %s of type %s (reason = \"%s\")"
                     uu____2422 uu____2423 r
                    in
                 (FStar_Errors.Fatal_UninstantiatedUnificationVarInTactic,
                   uu____2421, rng)) is
         in
      match errs with
      | [] -> ()
      | (e,msg,r)::tl1 ->
          (FStar_Tactics_Basic.dump_proofstate ps
             "failing due to uninstantiated implicits";
           FStar_Errors.add_errors tl1;
           FStar_Errors.raise_error (e, msg) r)
  
let (run_tactic_on_typ :
  FStar_Syntax_Syntax.term ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Tactics_Basic.goal Prims.list,FStar_Syntax_Syntax.term)
          FStar_Pervasives_Native.tuple2)
  =
  fun tactic  ->
    fun env  ->
      fun typ  ->
        (let uu____2472 = FStar_ST.op_Bang tacdbg  in
         if uu____2472
         then
           let uu____2492 = FStar_Syntax_Print.term_to_string tactic  in
           FStar_Util.print1 "About to reduce uvars on: %s\n" uu____2492
         else ());
        (let tactic1 =
           FStar_TypeChecker_Normalize.reduce_uvar_solutions env tactic  in
         (let uu____2496 = FStar_ST.op_Bang tacdbg  in
          if uu____2496
          then
            let uu____2516 = FStar_Syntax_Print.term_to_string tactic1  in
            FStar_Util.print1 "About to check tactic term: %s\n" uu____2516
          else ());
         (let uu____2518 =
            FStar_TypeChecker_TcTerm.tc_reified_tactic env tactic1  in
          match uu____2518 with
          | (uu____2531,uu____2532,g) ->
              (FStar_TypeChecker_Rel.force_trivial_guard env g;
               FStar_Errors.stop_if_err ();
               (let tau =
                  unembed_tactic_0 FStar_Syntax_Embeddings.unembed_unit
                    tactic1
                   in
                let uu____2539 = FStar_TypeChecker_Env.clear_expected_typ env
                   in
                match uu____2539 with
                | (env1,uu____2553) ->
                    let env2 =
                      let uu___59_2559 = env1  in
                      {
                        FStar_TypeChecker_Env.solver =
                          (uu___59_2559.FStar_TypeChecker_Env.solver);
                        FStar_TypeChecker_Env.range =
                          (uu___59_2559.FStar_TypeChecker_Env.range);
                        FStar_TypeChecker_Env.curmodule =
                          (uu___59_2559.FStar_TypeChecker_Env.curmodule);
                        FStar_TypeChecker_Env.gamma =
                          (uu___59_2559.FStar_TypeChecker_Env.gamma);
                        FStar_TypeChecker_Env.gamma_cache =
                          (uu___59_2559.FStar_TypeChecker_Env.gamma_cache);
                        FStar_TypeChecker_Env.modules =
                          (uu___59_2559.FStar_TypeChecker_Env.modules);
                        FStar_TypeChecker_Env.expected_typ =
                          (uu___59_2559.FStar_TypeChecker_Env.expected_typ);
                        FStar_TypeChecker_Env.sigtab =
                          (uu___59_2559.FStar_TypeChecker_Env.sigtab);
                        FStar_TypeChecker_Env.is_pattern =
                          (uu___59_2559.FStar_TypeChecker_Env.is_pattern);
                        FStar_TypeChecker_Env.instantiate_imp = false;
                        FStar_TypeChecker_Env.effects =
                          (uu___59_2559.FStar_TypeChecker_Env.effects);
                        FStar_TypeChecker_Env.generalize =
                          (uu___59_2559.FStar_TypeChecker_Env.generalize);
                        FStar_TypeChecker_Env.letrecs =
                          (uu___59_2559.FStar_TypeChecker_Env.letrecs);
                        FStar_TypeChecker_Env.top_level =
                          (uu___59_2559.FStar_TypeChecker_Env.top_level);
                        FStar_TypeChecker_Env.check_uvars =
                          (uu___59_2559.FStar_TypeChecker_Env.check_uvars);
                        FStar_TypeChecker_Env.use_eq =
                          (uu___59_2559.FStar_TypeChecker_Env.use_eq);
                        FStar_TypeChecker_Env.is_iface =
                          (uu___59_2559.FStar_TypeChecker_Env.is_iface);
                        FStar_TypeChecker_Env.admit =
                          (uu___59_2559.FStar_TypeChecker_Env.admit);
                        FStar_TypeChecker_Env.lax =
                          (uu___59_2559.FStar_TypeChecker_Env.lax);
                        FStar_TypeChecker_Env.lax_universes =
                          (uu___59_2559.FStar_TypeChecker_Env.lax_universes);
                        FStar_TypeChecker_Env.failhard =
                          (uu___59_2559.FStar_TypeChecker_Env.failhard);
                        FStar_TypeChecker_Env.nosynth =
                          (uu___59_2559.FStar_TypeChecker_Env.nosynth);
                        FStar_TypeChecker_Env.tc_term =
                          (uu___59_2559.FStar_TypeChecker_Env.tc_term);
                        FStar_TypeChecker_Env.type_of =
                          (uu___59_2559.FStar_TypeChecker_Env.type_of);
                        FStar_TypeChecker_Env.universe_of =
                          (uu___59_2559.FStar_TypeChecker_Env.universe_of);
                        FStar_TypeChecker_Env.check_type_of =
                          (uu___59_2559.FStar_TypeChecker_Env.check_type_of);
                        FStar_TypeChecker_Env.use_bv_sorts =
                          (uu___59_2559.FStar_TypeChecker_Env.use_bv_sorts);
                        FStar_TypeChecker_Env.qtbl_name_and_index =
                          (uu___59_2559.FStar_TypeChecker_Env.qtbl_name_and_index);
                        FStar_TypeChecker_Env.proof_ns =
                          (uu___59_2559.FStar_TypeChecker_Env.proof_ns);
                        FStar_TypeChecker_Env.synth =
                          (uu___59_2559.FStar_TypeChecker_Env.synth);
                        FStar_TypeChecker_Env.is_native_tactic =
                          (uu___59_2559.FStar_TypeChecker_Env.is_native_tactic);
                        FStar_TypeChecker_Env.identifier_info =
                          (uu___59_2559.FStar_TypeChecker_Env.identifier_info);
                        FStar_TypeChecker_Env.tc_hooks =
                          (uu___59_2559.FStar_TypeChecker_Env.tc_hooks);
                        FStar_TypeChecker_Env.dsenv =
                          (uu___59_2559.FStar_TypeChecker_Env.dsenv);
                        FStar_TypeChecker_Env.dep_graph =
                          (uu___59_2559.FStar_TypeChecker_Env.dep_graph)
                      }  in
                    let uu____2560 =
                      FStar_Tactics_Basic.proofstate_of_goal_ty env2 typ  in
                    (match uu____2560 with
                     | (ps,w) ->
                         ((let uu____2574 = FStar_ST.op_Bang tacdbg  in
                           if uu____2574
                           then
                             let uu____2594 =
                               FStar_Syntax_Print.term_to_string typ  in
                             FStar_Util.print1
                               "Running tactic with goal = %s\n" uu____2594
                           else ());
                          (let uu____2596 =
                             FStar_Util.record_time
                               (fun uu____2606  ->
                                  FStar_Tactics_Basic.run tau ps)
                              in
                           match uu____2596 with
                           | (res,ms) ->
                               ((let uu____2620 = FStar_ST.op_Bang tacdbg  in
                                 if uu____2620
                                 then
                                   let uu____2640 =
                                     FStar_Util.string_of_int ms  in
                                   FStar_Util.print1
                                     "Tactic ran in %s milliseconds\n"
                                     uu____2640
                                 else ());
                                (match res with
                                 | FStar_Tactics_Result.Success
                                     (uu____2648,ps1) ->
                                     ((let uu____2651 =
                                         FStar_ST.op_Bang tacdbg  in
                                       if uu____2651
                                       then
                                         let uu____2671 =
                                           FStar_Syntax_Print.term_to_string
                                             w
                                            in
                                         FStar_Util.print1
                                           "Tactic generated proofterm %s\n"
                                           uu____2671
                                       else ());
                                      FStar_List.iter
                                        (fun g1  ->
                                           let uu____2678 =
                                             FStar_Tactics_Basic.is_irrelevant
                                               g1
                                              in
                                           if uu____2678
                                           then
                                             let uu____2679 =
                                               FStar_TypeChecker_Rel.teq_nosmt
                                                 g1.FStar_Tactics_Types.context
                                                 g1.FStar_Tactics_Types.witness
                                                 FStar_Syntax_Util.exp_unit
                                                in
                                             (if uu____2679
                                              then ()
                                              else
                                                (let uu____2681 =
                                                   let uu____2682 =
                                                     FStar_Syntax_Print.term_to_string
                                                       g1.FStar_Tactics_Types.witness
                                                      in
                                                   FStar_Util.format1
                                                     "Irrelevant tactic witness does not unify with (): %s"
                                                     uu____2682
                                                    in
                                                 failwith uu____2681))
                                           else ())
                                        (FStar_List.append
                                           ps1.FStar_Tactics_Types.goals
                                           ps1.FStar_Tactics_Types.smt_goals);
                                      (let g1 =
                                         let uu___60_2685 =
                                           FStar_TypeChecker_Rel.trivial_guard
                                            in
                                         {
                                           FStar_TypeChecker_Env.guard_f =
                                             (uu___60_2685.FStar_TypeChecker_Env.guard_f);
                                           FStar_TypeChecker_Env.deferred =
                                             (uu___60_2685.FStar_TypeChecker_Env.deferred);
                                           FStar_TypeChecker_Env.univ_ineqs =
                                             (uu___60_2685.FStar_TypeChecker_Env.univ_ineqs);
                                           FStar_TypeChecker_Env.implicits =
                                             (ps1.FStar_Tactics_Types.all_implicits)
                                         }  in
                                       let g2 =
                                         let uu____2687 =
                                           FStar_TypeChecker_Rel.solve_deferred_constraints
                                             env2 g1
                                            in
                                         FStar_All.pipe_right uu____2687
                                           FStar_TypeChecker_Rel.resolve_implicits_tac
                                          in
                                       report_implicits ps1
                                         g2.FStar_TypeChecker_Env.implicits;
                                       ((FStar_List.append
                                           ps1.FStar_Tactics_Types.goals
                                           ps1.FStar_Tactics_Types.smt_goals),
                                         w)))
                                 | FStar_Tactics_Result.Failed (s,ps1) ->
                                     ((let uu____2694 =
                                         let uu____2695 =
                                           FStar_TypeChecker_Normalize.psc_subst
                                             ps1.FStar_Tactics_Types.psc
                                            in
                                         FStar_Tactics_Types.subst_proof_state
                                           uu____2695 ps1
                                          in
                                       FStar_Tactics_Basic.dump_proofstate
                                         uu____2694 "at the time of failure");
                                      (let uu____2696 =
                                         let uu____2701 =
                                           FStar_Util.format1
                                             "user tactic failed: %s" s
                                            in
                                         (FStar_Errors.Fatal_ArgumentLengthMismatch,
                                           uu____2701)
                                          in
                                       FStar_Errors.raise_error uu____2696
                                         typ.FStar_Syntax_Syntax.pos)))))))))))
  
type pol =
  | Pos 
  | Neg 
  | Both [@@deriving show]
let (uu___is_Pos : pol -> Prims.bool) =
  fun projectee  -> match projectee with | Pos  -> true | uu____2711 -> false 
let (uu___is_Neg : pol -> Prims.bool) =
  fun projectee  -> match projectee with | Neg  -> true | uu____2715 -> false 
let (uu___is_Both : pol -> Prims.bool) =
  fun projectee  ->
    match projectee with | Both  -> true | uu____2719 -> false
  
type 'a tres_m =
  | Unchanged of 'a 
  | Simplified of ('a,FStar_Tactics_Basic.goal Prims.list)
  FStar_Pervasives_Native.tuple2 
  | Dual of ('a,'a,FStar_Tactics_Basic.goal Prims.list)
  FStar_Pervasives_Native.tuple3 [@@deriving show]
let uu___is_Unchanged : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Unchanged _0 -> true | uu____2768 -> false
  
let __proj__Unchanged__item___0 : 'a . 'a tres_m -> 'a =
  fun projectee  -> match projectee with | Unchanged _0 -> _0 
let uu___is_Simplified : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Simplified _0 -> true | uu____2804 -> false
  
let __proj__Simplified__item___0 :
  'a .
    'a tres_m ->
      ('a,FStar_Tactics_Basic.goal Prims.list) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Simplified _0 -> _0 
let uu___is_Dual : 'a . 'a tres_m -> Prims.bool =
  fun projectee  ->
    match projectee with | Dual _0 -> true | uu____2854 -> false
  
let __proj__Dual__item___0 :
  'a .
    'a tres_m ->
      ('a,'a,FStar_Tactics_Basic.goal Prims.list)
        FStar_Pervasives_Native.tuple3
  = fun projectee  -> match projectee with | Dual _0 -> _0 
type tres = FStar_Syntax_Syntax.term tres_m[@@deriving show]
let tpure : 'Auu____2892 . 'Auu____2892 -> 'Auu____2892 tres_m =
  fun x  -> Unchanged x 
let (flip : pol -> pol) =
  fun p  -> match p with | Pos  -> Neg | Neg  -> Pos | Both  -> Both 
let (by_tactic_interp :
  pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) =
  fun pol  ->
    fun e  ->
      fun t  ->
        let uu____2911 = FStar_Syntax_Util.head_and_args t  in
        match uu____2911 with
        | (hd1,args) ->
            let uu____2948 =
              let uu____2961 =
                let uu____2962 = FStar_Syntax_Util.un_uinst hd1  in
                uu____2962.FStar_Syntax_Syntax.n  in
              (uu____2961, args)  in
            (match uu____2948 with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(rett,FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Implicit uu____2975))::(tactic,FStar_Pervasives_Native.None
                                                                 )::(assertion,FStar_Pervasives_Native.None
                                                                    )::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.by_tactic_lid
                 ->
                 (match pol with
                  | Pos  ->
                      let uu____3038 = run_tactic_on_typ tactic e assertion
                         in
                      (match uu____3038 with
                       | (gs,uu____3046) ->
                           Simplified (FStar_Syntax_Util.t_true, gs))
                  | Both  ->
                      let uu____3053 = run_tactic_on_typ tactic e assertion
                         in
                      (match uu____3053 with
                       | (gs,uu____3061) ->
                           Dual (assertion, FStar_Syntax_Util.t_true, gs))
                  | Neg  -> Simplified (assertion, []))
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(assertion,FStar_Pervasives_Native.None )::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.spinoff_lid
                 ->
                 (match pol with
                  | Pos  ->
                      let uu____3112 =
                        let uu____3119 =
                          let uu____3122 =
                            let uu____3123 =
                              FStar_Tactics_Basic.goal_of_goal_ty e assertion
                               in
                            FStar_All.pipe_left FStar_Pervasives_Native.fst
                              uu____3123
                             in
                          [uu____3122]  in
                        (FStar_Syntax_Util.t_true, uu____3119)  in
                      Simplified uu____3112
                  | Both  ->
                      let uu____3134 =
                        let uu____3147 =
                          let uu____3150 =
                            let uu____3151 =
                              FStar_Tactics_Basic.goal_of_goal_ty e assertion
                               in
                            FStar_All.pipe_left FStar_Pervasives_Native.fst
                              uu____3151
                             in
                          [uu____3150]  in
                        (assertion, FStar_Syntax_Util.t_true, uu____3147)  in
                      Dual uu____3134
                  | Neg  -> Simplified (assertion, []))
             | uu____3172 -> Unchanged t)
  
let explode :
  'a .
    'a tres_m ->
      ('a,'a,FStar_Tactics_Basic.goal Prims.list)
        FStar_Pervasives_Native.tuple3
  =
  fun t  ->
    match t with
    | Unchanged t1 -> (t1, t1, [])
    | Simplified (t1,gs) -> (t1, t1, gs)
    | Dual (tn,tp,gs) -> (tn, tp, gs)
  
let comb1 : 'a 'b . ('a -> 'b) -> 'a tres_m -> 'b tres_m =
  fun f  ->
    fun uu___57_3252  ->
      match uu___57_3252 with
      | Unchanged t -> let uu____3258 = f t  in Unchanged uu____3258
      | Simplified (t,gs) ->
          let uu____3265 = let uu____3272 = f t  in (uu____3272, gs)  in
          Simplified uu____3265
      | Dual (tn,tp,gs) ->
          let uu____3282 =
            let uu____3291 = f tn  in
            let uu____3292 = f tp  in (uu____3291, uu____3292, gs)  in
          Dual uu____3282
  
let comb2 :
  'a 'b 'c . ('a -> 'b -> 'c) -> 'a tres_m -> 'b tres_m -> 'c tres_m =
  fun f  ->
    fun x  ->
      fun y  ->
        match (x, y) with
        | (Unchanged t1,Unchanged t2) ->
            let uu____3346 = f t1 t2  in Unchanged uu____3346
        | (Unchanged t1,Simplified (t2,gs)) ->
            let uu____3358 = let uu____3365 = f t1 t2  in (uu____3365, gs)
               in
            Simplified uu____3358
        | (Simplified (t1,gs),Unchanged t2) ->
            let uu____3379 = let uu____3386 = f t1 t2  in (uu____3386, gs)
               in
            Simplified uu____3379
        | (Simplified (t1,gs1),Simplified (t2,gs2)) ->
            let uu____3405 =
              let uu____3412 = f t1 t2  in
              (uu____3412, (FStar_List.append gs1 gs2))  in
            Simplified uu____3405
        | uu____3415 ->
            let uu____3424 = explode x  in
            (match uu____3424 with
             | (n1,p1,gs1) ->
                 let uu____3442 = explode y  in
                 (match uu____3442 with
                  | (n2,p2,gs2) ->
                      let uu____3460 =
                        let uu____3469 = f n1 n2  in
                        let uu____3470 = f p1 p2  in
                        (uu____3469, uu____3470, (FStar_List.append gs1 gs2))
                         in
                      Dual uu____3460))
  
let comb_list : 'a . 'a tres_m Prims.list -> 'a Prims.list tres_m =
  fun rs  ->
    let rec aux rs1 acc =
      match rs1 with
      | [] -> acc
      | hd1::tl1 ->
          let uu____3535 = comb2 (fun l  -> fun r  -> l :: r) hd1 acc  in
          aux tl1 uu____3535
       in
    aux (FStar_List.rev rs) (tpure [])
  
let emit : 'a . FStar_Tactics_Basic.goal Prims.list -> 'a tres_m -> 'a tres_m
  =
  fun gs  ->
    fun m  -> comb2 (fun uu____3578  -> fun x  -> x) (Simplified ((), gs)) m
  
let rec (traverse :
  (pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) ->
    pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres)
  =
  fun f  ->
    fun pol  ->
      fun e  ->
        fun t  ->
          let r =
            let uu____3612 =
              let uu____3613 = FStar_Syntax_Subst.compress t  in
              uu____3613.FStar_Syntax_Syntax.n  in
            match uu____3612 with
            | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
                let tr = traverse f pol e t1  in
                let uu____3625 =
                  comb1 (fun t'  -> FStar_Syntax_Syntax.Tm_uinst (t', us))
                   in
                uu____3625 tr
            | FStar_Syntax_Syntax.Tm_meta (t1,m) ->
                let tr = traverse f pol e t1  in
                let uu____3649 =
                  comb1 (fun t'  -> FStar_Syntax_Syntax.Tm_meta (t', m))  in
                uu____3649 tr
            | FStar_Syntax_Syntax.Tm_app
                ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                   FStar_Syntax_Syntax.pos = uu____3667;
                   FStar_Syntax_Syntax.vars = uu____3668;_},(p,uu____3670)::
                 (q,uu____3672)::[])
                when
                FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.imp_lid
                ->
                let x =
                  let uu____3712 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero p
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____3712
                   in
                let r1 = traverse f (flip pol) e p  in
                let r2 =
                  let uu____3715 = FStar_TypeChecker_Env.push_bv e x  in
                  traverse f pol uu____3715 q  in
                comb2
                  (fun l  ->
                     fun r  ->
                       let uu____3721 = FStar_Syntax_Util.mk_imp l r  in
                       uu____3721.FStar_Syntax_Syntax.n) r1 r2
            | FStar_Syntax_Syntax.Tm_app
                ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                   FStar_Syntax_Syntax.pos = uu____3725;
                   FStar_Syntax_Syntax.vars = uu____3726;_},(p,uu____3728)::
                 (q,uu____3730)::[])
                when
                FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.iff_lid
                ->
                let xp =
                  let uu____3770 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero p
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____3770
                   in
                let xq =
                  let uu____3772 =
                    FStar_Syntax_Util.mk_squash FStar_Syntax_Syntax.U_zero q
                     in
                  FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                    uu____3772
                   in
                let r1 =
                  let uu____3774 = FStar_TypeChecker_Env.push_bv e xq  in
                  traverse f Both uu____3774 p  in
                let r2 =
                  let uu____3776 = FStar_TypeChecker_Env.push_bv e xp  in
                  traverse f Both uu____3776 q  in
                (match (r1, r2) with
                 | (Unchanged uu____3779,Unchanged uu____3780) ->
                     comb2
                       (fun l  ->
                          fun r  ->
                            let uu____3790 = FStar_Syntax_Util.mk_iff l r  in
                            uu____3790.FStar_Syntax_Syntax.n) r1 r2
                 | uu____3793 ->
                     let uu____3798 = explode r1  in
                     (match uu____3798 with
                      | (pn,pp,gs1) ->
                          let uu____3816 = explode r2  in
                          (match uu____3816 with
                           | (qn,qp,gs2) ->
                               let t1 =
                                 let uu____3837 =
                                   FStar_Syntax_Util.mk_imp pn qp  in
                                 let uu____3838 =
                                   FStar_Syntax_Util.mk_imp qn pp  in
                                 FStar_Syntax_Util.mk_conj uu____3837
                                   uu____3838
                                  in
                               Simplified
                                 ((t1.FStar_Syntax_Syntax.n),
                                   (FStar_List.append gs1 gs2)))))
            | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
                let r0 = traverse f pol e hd1  in
                let r1 =
                  FStar_List.fold_right
                    (fun uu____3890  ->
                       fun r  ->
                         match uu____3890 with
                         | (a,q) ->
                             let r' = traverse f pol e a  in
                             comb2
                               (fun a1  -> fun args1  -> (a1, q) :: args1) r'
                               r) args (tpure [])
                   in
                comb2
                  (fun hd2  ->
                     fun args1  -> FStar_Syntax_Syntax.Tm_app (hd2, args1))
                  r0 r1
            | FStar_Syntax_Syntax.Tm_abs (bs,t1,k) ->
                let uu____4008 = FStar_Syntax_Subst.open_term bs t1  in
                (match uu____4008 with
                 | (bs1,topen) ->
                     let e' = FStar_TypeChecker_Env.push_binders e bs1  in
                     let r0 =
                       FStar_List.map
                         (fun uu____4042  ->
                            match uu____4042 with
                            | (bv,aq) ->
                                let r =
                                  traverse f (flip pol) e
                                    bv.FStar_Syntax_Syntax.sort
                                   in
                                let uu____4056 =
                                  comb1
                                    (fun s'  ->
                                       ((let uu___61_4080 = bv  in
                                         {
                                           FStar_Syntax_Syntax.ppname =
                                             (uu___61_4080.FStar_Syntax_Syntax.ppname);
                                           FStar_Syntax_Syntax.index =
                                             (uu___61_4080.FStar_Syntax_Syntax.index);
                                           FStar_Syntax_Syntax.sort = s'
                                         }), aq))
                                   in
                                uu____4056 r) bs1
                        in
                     let rbs = comb_list r0  in
                     let rt = traverse f pol e' topen  in
                     comb2
                       (fun bs2  ->
                          fun t2  ->
                            let uu____4100 = FStar_Syntax_Util.abs bs2 t2 k
                               in
                            uu____4100.FStar_Syntax_Syntax.n) rbs rt)
            | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,ef) ->
                let uu____4146 = traverse f pol e t1  in
                let uu____4151 =
                  comb1
                    (fun t2  -> FStar_Syntax_Syntax.Tm_ascribed (t2, asc, ef))
                   in
                uu____4151 uu____4146
            | x -> tpure x  in
          match r with
          | Unchanged tn' ->
              f pol e
                (let uu___62_4189 = t  in
                 {
                   FStar_Syntax_Syntax.n = tn';
                   FStar_Syntax_Syntax.pos =
                     (uu___62_4189.FStar_Syntax_Syntax.pos);
                   FStar_Syntax_Syntax.vars =
                     (uu___62_4189.FStar_Syntax_Syntax.vars)
                 })
          | Simplified (tn',gs) ->
              let uu____4196 =
                f pol e
                  (let uu___63_4200 = t  in
                   {
                     FStar_Syntax_Syntax.n = tn';
                     FStar_Syntax_Syntax.pos =
                       (uu___63_4200.FStar_Syntax_Syntax.pos);
                     FStar_Syntax_Syntax.vars =
                       (uu___63_4200.FStar_Syntax_Syntax.vars)
                   })
                 in
              emit gs uu____4196
          | Dual (tn,tp,gs) ->
              let rp =
                f pol e
                  (let uu___64_4210 = t  in
                   {
                     FStar_Syntax_Syntax.n = tp;
                     FStar_Syntax_Syntax.pos =
                       (uu___64_4210.FStar_Syntax_Syntax.pos);
                     FStar_Syntax_Syntax.vars =
                       (uu___64_4210.FStar_Syntax_Syntax.vars)
                   })
                 in
              let uu____4211 = explode rp  in
              (match uu____4211 with
               | (uu____4220,p',gs') ->
                   Dual
                     ((let uu___65_4234 = t  in
                       {
                         FStar_Syntax_Syntax.n = tn;
                         FStar_Syntax_Syntax.pos =
                           (uu___65_4234.FStar_Syntax_Syntax.pos);
                         FStar_Syntax_Syntax.vars =
                           (uu___65_4234.FStar_Syntax_Syntax.vars)
                       }), p', (FStar_List.append gs gs')))
  
let (getprop :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun e  ->
    fun t  ->
      let tn =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Weak;
          FStar_TypeChecker_Normalize.HNF;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.Delta_constant] e t
         in
      FStar_Syntax_Util.un_squash tn
  
let (preprocess :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_TypeChecker_Env.env,FStar_Syntax_Syntax.term,FStar_Options.optionstate)
        FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun env  ->
    fun goal  ->
      (let uu____4269 =
         FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac")  in
       FStar_ST.op_Colon_Equals tacdbg uu____4269);
      (let uu____4290 = FStar_ST.op_Bang tacdbg  in
       if uu____4290
       then
         let uu____4310 =
           let uu____4311 = FStar_TypeChecker_Env.all_binders env  in
           FStar_All.pipe_right uu____4311
             (FStar_Syntax_Print.binders_to_string ",")
            in
         let uu____4312 = FStar_Syntax_Print.term_to_string goal  in
         FStar_Util.print2 "About to preprocess %s |= %s\n" uu____4310
           uu____4312
       else ());
      (let initial = ((Prims.parse_int "1"), [])  in
       let uu____4341 =
         let uu____4348 = traverse by_tactic_interp Pos env goal  in
         match uu____4348 with
         | Unchanged t' -> (t', [])
         | Simplified (t',gs) -> (t', gs)
         | uu____4366 -> failwith "no"  in
       match uu____4341 with
       | (t',gs) ->
           ((let uu____4388 = FStar_ST.op_Bang tacdbg  in
             if uu____4388
             then
               let uu____4408 =
                 let uu____4409 = FStar_TypeChecker_Env.all_binders env  in
                 FStar_All.pipe_right uu____4409
                   (FStar_Syntax_Print.binders_to_string ", ")
                  in
               let uu____4410 = FStar_Syntax_Print.term_to_string t'  in
               FStar_Util.print2 "Main goal simplified to: %s |- %s\n"
                 uu____4408 uu____4410
             else ());
            (let s = initial  in
             let s1 =
               FStar_List.fold_left
                 (fun uu____4457  ->
                    fun g  ->
                      match uu____4457 with
                      | (n1,gs1) ->
                          let phi =
                            let uu____4502 =
                              getprop g.FStar_Tactics_Types.context
                                g.FStar_Tactics_Types.goal_ty
                               in
                            match uu____4502 with
                            | FStar_Pervasives_Native.None  ->
                                let uu____4505 =
                                  let uu____4506 =
                                    FStar_Syntax_Print.term_to_string
                                      g.FStar_Tactics_Types.goal_ty
                                     in
                                  FStar_Util.format1
                                    "Tactic returned proof-relevant goal: %s"
                                    uu____4506
                                   in
                                failwith uu____4505
                            | FStar_Pervasives_Native.Some phi -> phi  in
                          ((let uu____4509 = FStar_ST.op_Bang tacdbg  in
                            if uu____4509
                            then
                              let uu____4529 = FStar_Util.string_of_int n1
                                 in
                              let uu____4530 =
                                FStar_Tactics_Basic.goal_to_string g  in
                              FStar_Util.print2 "Got goal #%s: %s\n"
                                uu____4529 uu____4530
                            else ());
                           (let gt' =
                              let uu____4533 =
                                let uu____4534 = FStar_Util.string_of_int n1
                                   in
                                Prims.strcat "Could not prove goal #"
                                  uu____4534
                                 in
                              FStar_TypeChecker_Util.label uu____4533
                                goal.FStar_Syntax_Syntax.pos phi
                               in
                            ((n1 + (Prims.parse_int "1")),
                              (((g.FStar_Tactics_Types.context), gt',
                                 (g.FStar_Tactics_Types.opts)) :: gs1))))) s
                 gs
                in
             let uu____4549 = s1  in
             match uu____4549 with
             | (uu____4570,gs1) ->
                 let uu____4588 =
                   let uu____4595 = FStar_Options.peek ()  in
                   (env, t', uu____4595)  in
                 uu____4588 :: gs1)))
  
let (reify_tactic : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun a  ->
    let r =
      let uu____4606 =
        let uu____4607 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.reify_tactic_lid
            FStar_Syntax_Syntax.Delta_equational FStar_Pervasives_Native.None
           in
        FStar_Syntax_Syntax.fv_to_tm uu____4607  in
      FStar_Syntax_Syntax.mk_Tm_uinst uu____4606 [FStar_Syntax_Syntax.U_zero]
       in
    let uu____4608 =
      let uu____4609 =
        let uu____4610 = FStar_Syntax_Syntax.iarg FStar_Syntax_Syntax.t_unit
           in
        let uu____4611 =
          let uu____4614 = FStar_Syntax_Syntax.as_arg a  in [uu____4614]  in
        uu____4610 :: uu____4611  in
      FStar_Syntax_Syntax.mk_Tm_app r uu____4609  in
    uu____4608 FStar_Pervasives_Native.None a.FStar_Syntax_Syntax.pos
  
let (synth :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun typ  ->
      fun tau  ->
        (let uu____4627 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac")  in
         FStar_ST.op_Colon_Equals tacdbg uu____4627);
        (let uu____4647 =
           let uu____4654 = reify_tactic tau  in
           run_tactic_on_typ uu____4654 env typ  in
         match uu____4647 with
         | (gs,w) ->
             let uu____4661 =
               FStar_List.existsML
                 (fun g  ->
                    let uu____4665 =
                      let uu____4666 =
                        getprop g.FStar_Tactics_Types.context
                          g.FStar_Tactics_Types.goal_ty
                         in
                      FStar_Option.isSome uu____4666  in
                    Prims.op_Negation uu____4665) gs
                in
             if uu____4661
             then
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                   "synthesis left open goals") typ.FStar_Syntax_Syntax.pos
             else w)
  