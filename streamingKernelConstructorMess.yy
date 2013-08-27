
StreamingKernelConstructor :  STREAMS StreamInitializer StreamDeclarator Block
                              {
                                 NodeAbstract *cons( nullptr );
                                 cons = new NodeAbstract();
                                 assert( cons != nullptr );

                                 cons->set_name( "StreamingConstructorDeclaration" );
                                 $2->MakeSibling( $3 );
                                 $2->MakeSibling( $4 );
                                 cons->AdoptChildren( $2 );
                                 $$ = cons;  
                              }

                           |  STREAMS StreamInitializer StreamDeclarator COLON ClassInitializers SEMI
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new NodeAbstract();
                              assert( cons != nullptr );

                              cons->set_name( "StreamingConstructorDeclaration" );
                              $2->MakeSibling( $3 );
                              $2->MakeSibling( $5 );
                              cons->AdoptChildren( $2 );
                              $$ = cons;
                           }
                           |  STREAMS StreamInitializer StreamDeclarator COLON ClassInitializers Block
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new NodeAbstract();
                              assert( cons != nullptr );

                              cons->set_name( "StreamingConstructorDeclaration" );
                              $2->MakeSibling( $3 );
                              $2->MakeSibling( $5 );
                              $2->MakeSibling( $6 );
                              cons->AdoptChildren( $2 );
                              $$ = cons;
                           }
                           ;
